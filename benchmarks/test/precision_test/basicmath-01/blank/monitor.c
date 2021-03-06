
#include "IPCFG_TYPE.h"


#ifdef ACES_LIST
#include "list/aces_list.h"
#endif

#ifdef ACES_AVLTREE
#include "tree/aces_avltree.h"
#endif

#ifdef ACES_HASH
#include "hash/aces_hash.h"
#endif


#include "stack/aces_stack.h"

#include "BBNode.h"
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "monitor.h"

#include <sys/time.h>

#define true 1
#define false 0

struct BBNode;

//#define ACES_DEBUG

//#define ACES_APP_DEBUG
//#define ACES_MON_DEBUG
//#define ACES_MINIMAL_DEBUG
//#define MONITOR_PROCESS_DEBUG

#define SIGNATURE_QUEUE_SIZE 100
//#define SIGNATURE_QUEUE_SIZE 500
//#define SIGNATURE_QUEUE_SIZE 1000
//#define SIGNATURE_QUEUE_SIZE 5000
//#define SIGNATURE_QUEUE_SIZE 500000 // 500,000 
//#define SIGNATURE_QUEUE_SIZE 1000000 // 1,000,000
//#define SIGNATURE_QUEUE_SIZE 5000000 // 5,000,000 (error)

/* total */

//#define QUEUE_FULL_OVERHEAD
#ifdef  QUEUE_FULL_OVERHEAD

struct timeval queue_full_begTick;
struct timeval queue_full_endTick;
unsigned int total_queue_full_time = 0;

#endif

//#define APP_STACK_POP_OVERHEAD
#ifdef  APP_STACK_POP_OVERHEAD

struct timeval app_stack_pop_begTick;
struct timeval app_stack_pop_endTick;
unsigned int total_app_stack_pop_time = 0;

#endif

//#define APP_STACK_PUSH_OVERHEAD
#ifdef  APP_STACK_PUSH_OVERHEAD

struct timeval app_stack_push_begTick;
struct timeval app_stack_push_endTick;
unsigned int total_app_stack_push_time = 0;

#endif


//#define ASM_OVERHEAD
#ifdef  ASM_OVERHEAD

struct timeval enqueue_begTick;
struct timeval enqueue_endTick;
unsigned int total_enqueue_time = 0;

#endif

/* copy */
//#define APP_THREAD_OVERHEAD
#ifdef  APP_THREAD_OVERHEAD

struct timeval copy_begTick;
struct timeval copy_endTick;
unsigned int total_copy_time = 0;

struct timeval stack_begTick;
struct timeval stack_endTick;
unsigned int total_stack_time = 0;

struct timeval ipcfg_begTick;
struct timeval ipcfg_endTick;
unsigned int total_ipcfg_time = 0;

#endif

//#define MON_THREAD_OVERHEAD
#ifdef  MON_THREAD_OVERHEAD

struct timeval thread_creation_begTick;
struct timeval thread_creation_endTick;
unsigned int total_thread_creation_time = 0;

#endif



//#define MONITOR_THREAD_OVERHEAD
#ifdef MONITOR_THREAD_OVERHEAD


struct timeval copy_begTick;
struct timeval copy_endTick;

struct timeval verify_begTick;
struct timeval verify_endTick;

struct timeval wait_begTick;
struct timeval wait_endTick;


unsigned int total_copy_time = 0;
unsigned int total_verify_time = 0;
unsigned int total_wait_time = 0;

#ifdef MONITOR_THREAD_OVERHEAD_1

struct timeval dequeue_begTick;
struct timeval dequeue_endTick;

struct timeval verify_1_begTick;
struct timeval verify_1_endTick;

unsigned int total_dequeue_time = 0;
unsigned int total_verify_1_time = 0;

#endif

#endif

//#define SIGNATURE_QUEUE_SIZE 100
//#define SIGNATURE_QUEUE_SIZE 500
//#define SIGNATURE_QUEUE_SIZE 1000
//#define SIGNATURE_QUEUE_SIZE 5000
#define SIGNATURE_QUEUE_SIZE 500000 // 500,000 (error)
//#define SIGNATURE_QUEUE_SIZE 5000000 // 5,000,000 (error)



INTEGRATED_CFG* p_integrated_CFG = NULL;
ReturnPointStack* p_app_current_returnPointStack = NULL;
ReturnPointStack* p_app_prior_returnPointStack = NULL;

unsigned int current_queue_size = 0;

unsigned int signature_queue[SIGNATURE_QUEUE_SIZE];
unsigned int leverage_signature = 10;

unsigned int is_signature_queue_full = 0;

unsigned int is_queue_copy_finish = 0;
unsigned int is_monitor_initialized = 0;
unsigned int is_monitor_process_finish = 1;


/* is_monitor_finished : only for monitor thread */
unsigned int is_monitor_finished = 0;

typedef struct
{
	int* copied_signature_queue;
	int copied_signature_queue_size;
	ReturnPointStack* p_mon_returnPointStack;	

}monitor_dat;




pthread_t mon_thread;

/* monitor */
void monitor_process(
		unsigned int* mon_signature_queue, 
		unsigned int mon_signature_queue_size,
		ReturnPointStack* mon_returnPointStack
		)
{
#ifdef ACES_MINIMAL_DEBUG
	printf(" [monitor] Monitor process starts..\n");
#endif
	

	/* BBNode */
	BBNode *currentBasicBlock = (BBNode*)malloc(sizeof(BBNode));
	BBNode *to_free_currentBasicBlock = currentBasicBlock;

	
	/* init node_id = 10 */
	currentBasicBlock->node_id = 10;


	/*
#ifdef ACES_LIST	
	currentBasicBlock = search(p_integrated_CFG, leverage_signature);
#endif

#ifdef ACES_AVLTREE
	currentBasicBlock = search(p_integrated_CFG->root, leverage_signature);
#endif

#ifdef ACES_HASH
	currentBasicBlock = search(p_integrated_CFG, leverage_signature);
#endif
	*/


/*
	if(currentBasicBlock == NULL)
	{
		printf(" [ERROR] leverage_signature is not found!\n");
	}
	else
	{
#ifdef MONITOR_PROCESS_DEBUG
		printf(" [monitor] leverage_signature is found[%d]: %x\n", ++monitor_process_num, leverage_signature);
#endif
	}
*/

#ifdef MONITOR_PROCESS_DEBUG
		
		pid_t pid;
		pthread_t tid;
		pid = getpid();
		tid = pthread_self();
		
		static int monitor_process_num =0;
		printf(" [monitor][process]: %d, tid: %u, pid: %u\n", ++monitor_process_num, tid, pid);
#endif


	/* dequeue and verification */
	for(int i=0; i< mon_signature_queue_size; i++)
	{
		// signature_dequeue
		unsigned int node_id = dequeue_signature(mon_signature_queue, i);

		// signature_verification
		signature_verification(node_id, &currentBasicBlock, mon_returnPointStack);
	}



	/* update leverage_signature */
	//leverage_signature = copied_signature_queue[copied_signature_queue_size-1];

#ifdef ACES_MINIMAL_DEBUG
	printf(" [monitor] Monitor process has finished!\n");
#endif

	free(to_free_currentBasicBlock);

}



/* monitor */
// monitor_routine: each monitor_routine
void* monitor_routine(void*arg)
{	

#ifdef MON_THREAD_OVERHEAD
	gettimeofday(&thread_creation_endTick, NULL);
	printf(" [mon] Thread creation Time: %ld, ", (thread_creation_endTick.tv_sec - thread_creation_begTick.tv_sec) * 1000000 + (thread_creation_endTick.tv_usec - thread_creation_begTick.tv_usec));
	total_thread_creation_time += ((thread_creation_endTick.tv_sec - thread_creation_begTick.tv_sec) * 1000000 + (thread_creation_endTick.tv_usec - thread_creation_begTick.tv_usec));
	printf(" [mon] Total Thread creation Time: %ld\n", total_thread_creation_time);
#endif

	pid_t pid;
	pthread_t tid;
	pid = getpid();
	tid = pthread_self();
		
	monitor_dat* mon_dat = (monitor_dat*)arg;
	int* mon_signature_queue = (mon_dat)->copied_signature_queue;
	int* mon_signature_queue_size = (mon_dat)->copied_signature_queue_size;
	ReturnPointStack* mon_returnPointStack = (mon_dat)->p_mon_returnPointStack;
	


#ifdef ACES_MINIMAL_DEBUG
	printf(" [monitor] Thread_routine start: tid[%u](pid[%u])\n", (unsigned int)tid, (unsigned int)pid);
#endif



#ifdef MONITOR_THREAD_OVERHEAD
	gettimeofday(&verify_begTick, NULL);
#endif

	/* copied_signature_queue verification */
	monitor_process(mon_signature_queue, *mon_signature_queue_size, mon_returnPointStack);


#ifdef MONITOR_THREAD_OVERHEAD
	gettimeofday(&verify_endTick, NULL);
	printf(" [mon] Verification Time: %ld, ", (verify_endTick.tv_sec - verify_begTick.tv_sec) * 1000000 + (verify_endTick.tv_usec - verify_begTick.tv_usec));
	total_verify_time += ((verify_endTick.tv_sec - verify_begTick.tv_sec) * 1000000 + (verify_endTick.tv_usec - verify_begTick.tv_usec));
	printf(" [mon] Total Verification Time: %ld\n", total_verify_time);
#endif


#ifdef ACES_MINIMAL_DEBUG
	printf(" [monitor] Thread_routine finish: tid[%u](pid[%u])\n", (unsigned int)tid, (unsigned int)pid);
#endif


	/* release copied_queue, returnPoinStack */
	free(mon_signature_queue_size);
	free(mon_signature_queue);
	free(mon_returnPointStack);
	free(mon_dat);
}




/* monitor */
void initialize_monitor()
{

	/* generate IPCFG */
#ifdef ACES_MINIMAL_DEBUG
	printf(" [monitor] monitor_init!\n");
#endif	
	
#ifdef APP_THREAD_OVERHEAD
	gettimeofday(&ipcfg_begTick, NULL);
#endif

	// Initialize Application-thread function return stack
	p_app_current_returnPointStack = (Stack* )malloc(sizeof(Stack));
	InitStack(p_app_current_returnPointStack);
	
	p_app_prior_returnPointStack = (Stack* )malloc(sizeof(Stack));
	InitStack(p_app_prior_returnPointStack);



	// Initialize IPCFG
	initialize_monitor_routine(1);

#ifdef APP_THREAD_OVERHEAD
	gettimeofday(&ipcfg_endTick, NULL);
	printf(" [mon] IPCFG Generation Time: %ld\n", (ipcfg_endTick.tv_sec - ipcfg_begTick.tv_sec) * 1000000 + (ipcfg_endTick.tv_usec - ipcfg_begTick.tv_usec));
#endif
	
}


//////////////////////////////////////////////////////////////////////
/* 							init_monitor		 					*/
//////////////////////////////////////////////////////////////////////


/* target */
void init_monitor()
{	
	initialize_monitor();	
}




// monitor_thread_generator
void monitor_thread_generator()
{

#ifdef APP_THREAD_OVERHEAD
	gettimeofday(&copy_begTick, NULL);
#endif

	/* copy */
	int* copied_signature_queue = (int*)malloc(sizeof(int) * current_queue_size);
	int* copied_signature_queue_size = (int*)malloc(sizeof(int));
	*copied_signature_queue_size = current_queue_size;

	int i;
	// copy signature_queue
	for(i=0; i<current_queue_size;i++)
	{
		copied_signature_queue[i] = signature_queue[i];
	}
	monitor_dat* mon_dat = (monitor_dat*)malloc(sizeof(monitor_dat));
	mon_dat->copied_signature_queue = copied_signature_queue;
	mon_dat->copied_signature_queue_size = copied_signature_queue_size;

	// copy prior_returnPointStack
	mon_dat->p_mon_returnPointStack = copy_stack(p_app_prior_returnPointStack);

#ifdef APP_THREAD_OVERHEAD
	gettimeofday(&copy_endTick, NULL);
	printf(" [mon] Copy Time: %ld, ", (copy_endTick.tv_sec - copy_begTick.tv_sec) * 1000000 + (copy_endTick.tv_usec - copy_begTick.tv_usec));
	total_copy_time += ((copy_endTick.tv_sec - copy_begTick.tv_sec) * 1000000 + (copy_endTick.tv_usec - copy_begTick.tv_usec));
	printf(" [mon] Total Copy Time: %ld\n", total_copy_time);
#endif


	/* mon-thread gen */

#ifdef MON_THREAD_OVERHEAD
	gettimeofday(&thread_creation_begTick, NULL);
#endif
	pthread_create(&mon_thread, NULL, monitor_routine, (void*)mon_dat);

}


/* target */
void enqueue_signature(int i)
{
	/*
#ifdef ACES_APP_DEBUG
	printf(" [target][%dth] enqueue: 0x%x\n",current_queue_size ,i);
#endif

#ifdef ASM_OVERHEAD
	gettimeofday(&enqueue_begTick, NULL);
#endif
	
*/
	signature_queue[current_queue_size] = i;
	current_queue_size++;
		
	static int count =1;
	printf("basic_count: %d\n", count++);

	if(current_queue_size == SIGNATURE_QUEUE_SIZE)
	{
		current_queue_size = 0;
		//delete_stack(p_app_prior_returnPointStack);
		//p_app_prior_returnPointStack = copy_stack(p_app_current_returnPointStack);
		/*
#ifdef QUEUE_FULL_OVERHEAD
	gettimeofday(&queue_full_begTick, NULL);
#endif

		monitor_thread_generator();	
		current_queue_size = 0;
		delete_stack(p_app_prior_returnPointStack);
		p_app_prior_returnPointStack = copy_stack(p_app_current_returnPointStack);

#ifdef QUEUE_FULL_OVERHEAD
	gettimeofday(&queue_full_endTick, NULL);
	printf(" [mon] queue_full Time: %ld, ", (queue_full_endTick.tv_sec - queue_full_begTick.tv_sec) * 1000000 + (queue_full_endTick.tv_usec - queue_full_begTick.tv_usec));
	total_queue_full_time += ((queue_full_endTick.tv_sec - queue_full_begTick.tv_sec) * 1000000 + (queue_full_endTick.tv_usec - queue_full_begTick.tv_usec));
	printf(" [mon] Total queue_full Time: %ld\n", total_queue_full_time);
#endif

		*/
	}
/*
#ifdef ASM_OVERHEAD
	gettimeofday(&enqueue_endTick, NULL);
	//printf(" [mon] Enqueue Time: %ld, ", (enqueue_endTick.tv_sec - enqueue_begTick.tv_sec) * 1000000 + (enqueue_endTick.tv_usec - enqueue_begTick.tv_usec));
	total_enqueue_time += ((enqueue_endTick.tv_sec - enqueue_begTick.tv_sec) * 1000000 + (enqueue_endTick.tv_usec - enqueue_begTick.tv_usec));
	printf(" [mon] Total Enqueue Time: %ld\n", total_enqueue_time);
#endif
*/
}

void enqueue_signature_with_call(int i)
{
/*
#ifdef ACES_APP_DEBUG
	printf(" [target][%dth] enqueue with call: 0x%x\n",current_queue_size ,i);
#endif

#ifdef ASM_OVERHEAD
	gettimeofday(&enqueue_begTick, NULL);
#endif
*/
	signature_queue[current_queue_size] = i;
	current_queue_size++;
/*
#ifdef APP_STACK_PUSH_OVERHEAD
	gettimeofday(&app_stack_push_begTick, NULL);
#endif
	push(p_app_current_returnPointStack, i);	
#ifdef APP_STACK_PUSH_OVERHEAD
	gettimeofday(&app_stack_push_endTick, NULL);
	//printf(" [mon] Enqueue Time: %ld, ", (enqueue_endTick.tv_sec - enqueue_begTick.tv_sec) * 1000000 + (enqueue_endTick.tv_usec - enqueue_begTick.tv_usec));
	total_app_stack_push_time += ((app_stack_push_endTick.tv_sec - app_stack_push_begTick.tv_sec) * 1000000 + (app_stack_push_endTick.tv_usec - app_stack_push_begTick.tv_usec));
	printf(" [mon] Total app_stack_push Time: %ld\n", total_app_stack_push_time);
#endif
*/

	static int call_count =1;
	printf("call_count: %d\n", call_count++);
	push(p_app_current_returnPointStack, i);	
	
	if(current_queue_size == SIGNATURE_QUEUE_SIZE)
	{
		current_queue_size = 0;
		//delete_stack(p_app_prior_returnPointStack);
		//p_app_prior_returnPointStack = copy_stack(p_app_current_returnPointStack);
/*
#ifdef QUEUE_FULL_OVERHEAD
	gettimeofday(&queue_full_begTick, NULL);
#endif

		monitor_thread_generator();	
		current_queue_size = 0;
		delete_stack(p_app_prior_returnPointStack);
		p_app_prior_returnPointStack = copy_stack(p_app_current_returnPointStack);

#ifdef QUEUE_FULL_OVERHEAD
	gettimeofday(&queue_full_endTick, NULL);
	printf(" [mon] queue_full Time: %ld, ", (queue_full_endTick.tv_sec - queue_full_begTick.tv_sec) * 1000000 + (queue_full_endTick.tv_usec - queue_full_begTick.tv_usec));
	total_queue_full_time += ((queue_full_endTick.tv_sec - queue_full_begTick.tv_sec) * 1000000 + (queue_full_endTick.tv_usec - queue_full_begTick.tv_usec));
	printf(" [mon] Total queue_full Time: %ld\n", total_queue_full_time);
#endif
*/
	}

/*
#ifdef ASM_OVERHEAD
	gettimeofday(&enqueue_endTick, NULL);
	//printf(" [mon] Enqueue Time: %ld, ", (enqueue_endTick.tv_sec - enqueue_begTick.tv_sec) * 1000000 + (enqueue_endTick.tv_usec - enqueue_begTick.tv_usec));
	total_enqueue_time += ((enqueue_endTick.tv_sec - enqueue_begTick.tv_sec) * 1000000 + (enqueue_endTick.tv_usec - enqueue_begTick.tv_usec));
	printf(" [mon] Total Enqueue Time: %ld\n", total_enqueue_time);
#endif
*/
}


void enqueue_signature_with_return(int i)
{
/*
#ifdef ASM_OVERHEAD
	gettimeofday(&enqueue_begTick, NULL);
#endif

#ifdef ACES_APP_DEBUG
	printf(" [target][%dth] enqueue with return: 0x%x\n",current_queue_size ,i);
#endif
*/

	signature_queue[current_queue_size] = i;
	current_queue_size++;
/*	
#ifdef APP_STACK_POP_OVERHEAD
	gettimeofday(&app_stack_pop_begTick, NULL);
#endif
	pop(p_app_current_returnPointStack);

#ifdef APP_STACK_POP_OVERHEAD
	gettimeofday(&app_stack_pop_endTick, NULL);
	//printf(" [mon] Enqueue Time: %ld, ", (enqueue_endTick.tv_sec - enqueue_begTick.tv_sec) * 1000000 + (enqueue_endTick.tv_usec - enqueue_begTick.tv_usec));
	total_app_stack_pop_time += ((app_stack_pop_endTick.tv_sec - app_stack_pop_begTick.tv_sec) * 1000000 + (app_stack_pop_endTick.tv_usec - app_stack_pop_begTick.tv_usec));
	printf(" [mon] Total app_stack_pop Time: %ld\n", total_app_stack_pop_time);
#endif
*/
	
	static int return_count =1;
	printf("return_count: %d\n", return_count++);
	
	pop(p_app_current_returnPointStack);
	
	if(current_queue_size == SIGNATURE_QUEUE_SIZE)
	{
		current_queue_size = 0;
		//delete_stack(p_app_prior_returnPointStack);
		//p_app_prior_returnPointStack = copy_stack(p_app_current_returnPointStack);
/*
#ifdef QUEUE_FULL_OVERHEAD
	gettimeofday(&queue_full_begTick, NULL);
#endif
		monitor_thread_generator();	
		current_queue_size = 0;
		delete_stack(p_app_prior_returnPointStack);
		p_app_prior_returnPointStack = copy_stack(p_app_current_returnPointStack);

#ifdef QUEUE_FULL_OVERHEAD
	gettimeofday(&queue_full_endTick, NULL);
	printf(" [mon] queue_full Time: %ld, ", (queue_full_endTick.tv_sec - queue_full_begTick.tv_sec) * 1000000 + (queue_full_endTick.tv_usec - queue_full_begTick.tv_usec));
	total_queue_full_time += ((queue_full_endTick.tv_sec - queue_full_begTick.tv_sec) * 1000000 + (queue_full_endTick.tv_usec - queue_full_begTick.tv_usec));
	printf(" [mon] Total queue_full Time: %ld\n", total_queue_full_time);
#endif
*/
	}
/*
#ifdef ASM_OVERHEAD
	gettimeofday(&enqueue_endTick, NULL);
	//printf(" [mon] Enqueue Time: %ld, ", (enqueue_endTick.tv_sec - enqueue_begTick.tv_sec) * 1000000 + (enqueue_endTick.tv_usec - enqueue_begTick.tv_usec));
	total_enqueue_time += ((enqueue_endTick.tv_sec - enqueue_begTick.tv_sec) * 1000000 + (enqueue_endTick.tv_usec - enqueue_begTick.tv_usec));
	printf(" [mon] Total Enqueue Time: %ld\n", total_enqueue_time);
#endif
*/
}



/* monitor: dequeue and verification */


/* dequeue */
unsigned int dequeue_signature(unsigned int* copied_signature_queue, unsigned int deque_pointer)
{
	unsigned int return_node_id;
	return_node_id = copied_signature_queue[deque_pointer];
	
#ifdef ACES_MON_DEBUG
	printf(" [monitor] dequeue: 0x%x\n", return_node_id);
#endif
	return return_node_id;
}



/* signature verification */
/*
	1. if_has_connection_move
	2. search(aces_list)
*/   
void signature_verification(
		unsigned int node_id, 
		BBNode** currentBasicBlock,
		ReturnPointStack* mon_returnPointStack
		) 
{

#ifdef ACES_MON_DEBUG
	show_elements(mon_returnPointStack);
#endif
	BBNode* t_BBNode = (*currentBasicBlock);

	if(if_has_connection_move(
				p_integrated_CFG, 
				node_id, 
				currentBasicBlock,
				mon_returnPointStack
				) == true)
	{

#ifdef ACES_MON_DEBUG
		printf(" [monitor] verification: node(0x%x) to node(0x%x) is OK!\n", t_BBNode->node_id, node_id);
#endif
		return;
	}
	
	else
	{
		printf(" [Monitor] Found Error!\n");
		exit(-1);
		//currentBasicBlock = search(p_integrated_CFG, 0x00000001);

		return;
	}
}

/* if_has_connection_move */
/*
   1.search_and_change_currentBB
*/   

bool if_has_connection_move(
		INTEGRATED_CFG* p_integrated_CFG, 
		unsigned int node_id, 
		BBNode** currentBasicBlock,
		ReturnPointStack* mon_returnPointStack
		)
{

	/*
		connectionType

		- 0: RETURN
		- 1: BRANCH
		- 2: COND_BRANCH
		- 3: CALL
		- 4: MAIN RETURN

	*/


	/* INIT */
	/*
		If currentBasicBlock is a first dequeued BB,
		BasicBlock would be updated any input node_id.
	*/
	if((*currentBasicBlock)->node_id == 10)
	{

		search_and_change_currentBB(
				node_id, 
				currentBasicBlock);

	}
	
	/* RETURN */
	else if((*currentBasicBlock)->connectionType == 0)
	{
#ifdef ACES_DEBUG
		printf("  -BasicBlockType: RETURN(0), input_node_id: 0x%x, current_node_id: 0x%x, connectionArr[0]: 0x%x\n", node_id, (*currentBasicBlock)->node_id, (*currentBasicBlock)->connectionArr[0]);
#endif
		//unsigned int returnPoint = 	pop(p_returnPointStack);

		/*
			RETURN Basicblock could have many connectionNode.
		*/

		//unsigned int returnPoint = pop(p_returnPointStack);
		
		unsigned int returnPoint = pop(mon_returnPointStack);
		
#ifdef ACES_MON_DEBUG
		printf(" [stack][monitor] pop: %x\n", returnPoint);
#endif

		//BBNode* return_currentBasicBlock = search(returnPoint);

#ifdef ACES_LIST
		BBNode* return_currentBasicBlock = search(p_integrated_CFG, returnPoint);	
#endif

#ifdef ACES_AVLTREE
		BBNode* return_currentBasicBlock = search(p_integrated_CFG->root, returnPoint);	
#endif

#ifdef ACES_HASH
		BBNode* return_currentBasicBlock = search(p_integrated_CFG, returnPoint);
#endif
		
		
		if((return_currentBasicBlock)->connectionArr[1] != node_id)
		{
			return false;
		}
		else
		{
			search_and_change_currentBB(
					node_id, 
					currentBasicBlock);
		}


		/*
		if(returnPoint != node_id)
		{
			return false;
		}

		else
		{
			search_and_change_currentBB(
					node_id, 
					currentBasicBlock);
		}

		*/
		/*

		int connectionNum = (*currentBasicBlock)->connectionNum;
		int isConnected = 0;
		for(int i =0; i < connectionNum; i++)
		{
			if((*currentBasicBlock)->connectionArr[i] == node_id)
			{	
				isConnected = 1;
			}
		}

		if(isConnected != 1)
		{
			return false;
		}


		else
		{
			search_and_change_currentBB(
					node_id, 
					currentBasicBlock);
		}

		*/
	}

	/* CALL */
	else if((*currentBasicBlock)->connectionType == 3)
	{
#ifdef ACES_DEBUG
		printf("  -BasicBlockType: CALL(3), input_node_id: 0x%x, current_node_id: 0x%x, connectionArr[0]: 0x%x\n", node_id, (*currentBasicBlock)->node_id, (*currentBasicBlock)->connectionArr[0]);
#endif
		/*
			CALL has 2 connections
			connectionArr[0] is the node to jump (entry block of callee function)
			connectionArr[1...] is the node to return (next basicblock after callee function returns)

		*/
		if((*currentBasicBlock)->connectionArr[0] != node_id)
		{
			return false;
		}
		
		else
		{
			
			//push(mon_returnPointStack, (*currentBasicBlock)->connectionArr[0]);
			//printf(" [stack] push: %x\n", (*currentBasicBlock)->connectionArr[0]);
			
			push(mon_returnPointStack, (*currentBasicBlock)->node_id);
#ifdef ACES_MON_DEBUG
			printf(" [stack][monitor] push: %x\n", (*currentBasicBlock)->node_id);
#endif
			search_and_change_currentBB(
					node_id, 
					currentBasicBlock);
		}
	}

	/* BRANCH */
	else if((*currentBasicBlock)->connectionType == 1)
	{

#ifdef ACES_DEBUG
		printf("  -BasicBlockType: BRANCH(1), input_node_id: 0x%x, current_node_id: 0x%x, connectionArr[0]: 0x%x\n", node_id, (*currentBasicBlock)->node_id, (*currentBasicBlock)->connectionArr[0]);
#endif
		if((*currentBasicBlock)->connectionArr[0] != node_id)
		{
			return false;
		}
		else
		{
			search_and_change_currentBB(
					node_id, 
					currentBasicBlock);
		}
	}
	
	/* COND_BRANCH */
	else if((*currentBasicBlock)->connectionType == 2)
	{
#ifdef ACES_DEBUG
		printf("  -BasicBlockType: COND_BRANCH(2), input_node_id: 0x%x, current_node_id: 0x%x, connectionArr[0]: 0x%x\n", node_id, (*currentBasicBlock)->node_id, (*currentBasicBlock)->connectionArr[0]);
		printf("  -BasicBlockType: COND_BRANCH(2), input_node_id: 0x%x, current_node_id: 0x%x, connectionArr[1]: 0x%x\n", node_id, (*currentBasicBlock)->node_id, (*currentBasicBlock)->connectionArr[1]);
#endif
		if((*currentBasicBlock)->connectionArr[0] != node_id)
		{
			if((*currentBasicBlock)->connectionArr[1] != node_id)
			{
				return false;
			}
			
			else
			{
				search_and_change_currentBB(
						node_id, 
						currentBasicBlock);
			}
		}

		else
		{
			search_and_change_currentBB(
					node_id, 
					currentBasicBlock);
		}
	}

	/* EXIT */

	else if((*currentBasicBlock)->connectionType == 4)
	{
		
		printf(" [monitor] monitor has finished, no error is detected \n");
		exit(0);
		/*
		   How about just exit?
		is_monitor_finished = 1;

		*/
		
		return true;
	}
	

	else
	{
		printf("  [ERROR] undefined connectionType: \n");
		printf("  [node_id]: %x, [node_type]: %d", (*currentBasicBlock)->node_id, (*currentBasicBlock)->connectionType);
		
		return false;
	}
	return true;

}

/* seach_and_change_currentBB */
bool search_and_change_currentBB(
		unsigned int node_id, 
		BBNode** currentBasicBlock)
{

#ifdef ACES_LIST
	BBNode* next_bb = search(p_integrated_CFG, node_id);	
#endif

#ifdef ACES_AVLTREE
	BBNode* next_bb = search(p_integrated_CFG->root, node_id);	
#endif

#ifdef ACES_HASH
	BBNode* next_bb = search(p_integrated_CFG, node_id);
#endif

	*currentBasicBlock = next_bb;


	/* MAIN RETURN */

/*	if((*currentBasicBlock)->connectionType == 4)
	{
		BBNode* t_bb = (*currentBasicBlock);
		(*currentBasicBlock) = search(p_integrated_CFG, 0x00000001);
*/	
		/*	
		delete_stack(p_returnPointStack);
		InitStack(p_returnPointStack);
		*/
//	}

	return true;
}


/////////////////////////////////////////////////////////////////////////////////////////////////////



void add_basicblock(
	INTEGRATED_CFG* p_integrated_CFG,
	unsigned int node_id,
	unsigned int connectionType,
	unsigned int connectionNum,
	unsigned int connection_node_id)
{


#ifdef ACES_LIST
	BBNode* p_bb = search(p_integrated_CFG, node_id);
#endif

#ifdef ACES_AVLTREE
	BBNode* p_bb = search(p_integrated_CFG->root, node_id);
#endif

#ifdef ACES_HASH
	BBNode* p_bb = search(p_integrated_CFG, node_id);
#endif	

	/* if first input, */
	if(p_bb == NULL)
	{
		p_bb = (BBNode* )malloc(sizeof(BBNode));
		p_bb->node_id = node_id;
		p_bb->connectionType = connectionType;
		p_bb->connectionNum = connectionNum;
		p_bb->connectionArr = (unsigned int*)malloc(sizeof(unsigned int) * connectionNum);
		p_bb->currentNum = 0;
		p_bb->connectionArr[p_bb->currentNum] = connection_node_id;
		p_bb->currentNum++;
	
#ifdef ACES_LIST
//		printf("list\n");
		insert(p_integrated_CFG, p_bb);
#endif

#ifdef ACES_AVLTREE
//		printf("avltree\n");
		p_integrated_CFG->root = insert(p_integrated_CFG->root, p_bb);
#endif

#ifdef ACES_HASH
		insert(p_integrated_CFG, p_bb);
#endif
	

	}

	else
	{
		p_bb->connectionArr[p_bb->currentNum] = connection_node_id;
		p_bb->currentNum++;
	}
	
}


/////////////////////////////////////////////////////////////////////////////////////////////////////


