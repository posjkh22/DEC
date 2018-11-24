

///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
	
/*						HEADER						 */

///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////

/* configures of processing IPCFG */
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

#include "BBNode.h"
struct BBNode;


/* function stack */
#include "sstack/aces_sstack.h"


#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

/* set priority of monitor thread */
#include <sched.h>


#include "monitor.h"


/* debugging for execution time */
#include <sys/time.h>


/* benchmark meta data */
#include "benchmark_meta_data.h"


/* CFE injection */
#include "CFE_INJECTION.h"
#define CFE_INJECTION_ON


#define true 1
#define false 0


///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
/*
					CONFIGURATIONS	
*/
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////


/* Lists of configuration */

/* 1. DEBUG	TYPE */
//#define ACES_DEBUG
//#define ACES_APP_DEBUG
//#define ACES_MON_DEBUG
//#define ACES_MINIMAL_DEBUG
#define MONITOR_PROCESS_DEBUG


/* 2. signature queue size table */

// #include "benchmark_meta_data.h" 

/*
//#define SIGNATURE_QUEUE_SIZE 9000000 	// one
//#define SIGNATURE_QUEUE_SIZE 5000000 	// one
//#define SIGNATURE_QUEUE_SIZE 2500000 	// two
//#define SIGNATURE_QUEUE_SIZE 1700000 	// three 
#define SIGNATURE_QUEUE_SIZE 1300000 	// four 
*/

/* 3. The maximum number of signature queue	*/

#define NUMBER_OF_SIGNATURE_QUEUE 4


/* 4. Set priority of monitor thread */

#define SET_PRIORITY
//#define SHOW_PRIORITY



///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
/*
					GLOBAL VARIABLES	
*/
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////


/* Application thread: signature enqueue */
unsigned int current_queue_size = 0;
unsigned int* signature_queue;
unsigned int signature_queue_set[NUMBER_OF_SIGNATURE_QUEUE][SIGNATURE_QUEUE_SIZE];


/* Monitor thread: signature verification */

/* 1. monitor thread */
pthread_t mon_thread;
unsigned int monitor_process_num = 0;


/* 2. passing data-type from App to Monitor */
typedef struct
{
	unsigned int* copied_signature_queue;
	unsigned int copied_signature_queue_size;
	// static way
	unsigned int function_stack_number;

}monitor_dat;

/* 3. IPCFG */
INTEGRATED_CFG* p_integrated_CFG = NULL;


/* 4. MON_DAT */
monitor_dat monitor_dat_set[NUMBER_OF_SIGNATURE_QUEUE];


/* 5. Current BBNode */
BBNode BBNode_set[NUMBER_OF_SIGNATURE_QUEUE];




/* Not Used */
unsigned int leverage_signature = 10;
unsigned int is_queue_copy_finish = 0;
unsigned int is_monitor_process_finish = 1;
unsigned int is_monitor_initialized = 0;
unsigned int is_monitor_finished = 0;
unsigned int is_signature_queue_full = 0;



///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
/*
					MONITOR APIs	
*/
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////


/*
	Sequence of monitor thread
	1. monitor_routine -> 2. monitor_process -> 3. deque & verify signature -> 4. Traverse IPCFG
*/

/* 	Name: monitor_process */
/*
	Actual processing in monitor thread  
*/
void monitor_process(
		unsigned int* mon_signature_queue, 
		unsigned int mon_signature_queue_size,
		unsigned int function_stack_number
		)
{


	#ifdef ACES_MINIMAL_DEBUG
	printf(" [monitor] Monitor process starts..\n");
	#endif
	

	/* Current & Initial(temporary) BasicBlock Node */
	//BBNode *currentBasicBlock = (BBNode*)malloc(sizeof(BBNode));
	BBNode *currentBasicBlock = &BBNode_set[function_stack_number-2];
	


	/* Temporary variable for release memory */
	BBNode *to_free_currentBasicBlock = currentBasicBlock;

	
	/* init node_id = 10 */
	currentBasicBlock->node_id = 10;


	#ifdef MONITOR_PROCESS_DEBUG
		
	pid_t pid;
	pthread_t tid;
	pid = getpid();
	tid = pthread_self();
		
	static int monitor_process_num =0;
	printf(" [Monitor Thread Info]: %d, tid: %u, pid: %u,\\
	signature_queue_size: %u, function_stack_number:\\
	%d, static_stack_size: %d\n", ++monitor_process_num, 
		(int)tid, (int)pid, mon_signature_queue_size, 
		function_stack_number, static_show_stack_size(function_stack_number));
	
	#endif


	/* dequeue and verification */
	for(int i=0; i< mon_signature_queue_size; i++)
	{
		/* 	signature_dequeue	*/
		unsigned int node_id = dequeue_signature(mon_signature_queue, i);

		/* 	signature_verification	*/
		signature_verification(node_id, &currentBasicBlock, function_stack_number);
	}


	#ifdef ACES_MINIMAL_DEBUG
	printf(" [monitor] Monitor process has finished!\n");
	#endif

	//free(to_free_currentBasicBlock);

}


/* 	Name: monitor_routine */
/*
	Configure monitor thread and Get passing data from App thread. 
*/
void* monitor_routine(void*arg)
{	

	/* Configure the priority of monitor thread: LOW */

	#ifdef SET_PRIORITY
	int ret;

	pid_t app_pid = getpid();
	pthread_t app_thread = pthread_self();
	struct sched_param params1;
	struct sched_param params2;
	
	params1.sched_priority = sched_get_priority_min(SCHED_FIFO);
	ret = pthread_setschedparam(app_thread, SCHED_FIFO, &params1);

	if(ret !=0)
	{
		printf(" - Failed to pthread_setschedparams\n");
	}

	int policy = 0;
	ret = pthread_getschedparam(app_thread, &policy, &params2);
	policy = sched_getscheduler(app_pid);

	#ifdef SHOW_PRIORITY
	printf(" - This app policy: %d\n", policy);
	printf(" - App thread priority: %d\n", params2.sched_priority);
	#endif

	#endif


	/* Monitor thread information for debugging */

	pid_t pid;
	pthread_t tid;
	pid = getpid();
	tid = pthread_self();


	/* Get passing data from App thread */
	/*
		1. Signature Queue
		2. Function Stack
	*/
	monitor_dat* mon_dat 					= (monitor_dat*)arg;
	unsigned int* mon_signature_queue 		= (mon_dat)->copied_signature_queue;
	unsigned int mon_signature_queue_size 	= (mon_dat)->copied_signature_queue_size;
	unsigned int function_stack_number 		= (mon_dat)->function_stack_number;


	#ifdef ACES_MINIMAL_DEBUG
	printf(" [monitor] Thread_routine start: \\
			tid[%u](pid[%u]), signature_queue_size: %ld\n", 
			(unsigned int)tid, (unsigned int)pid, 
			mon_signature_queue_size);
	#endif


	/* Run a seqeunce of monitor thread routine */
	monitor_process(mon_signature_queue, mon_signature_queue_size, function_stack_number);



	#ifdef ACES_MINIMAL_DEBUG
	printf(" [monitor] Thread_routine finish: tid[%u](pid[%u])\n", (unsigned int)tid, (unsigned int)pid);
	#endif


	/* Memory release for passing data from App thread */	
	//free(mon_dat);
	
}




/* 	Name: init_monitor */
/*
	The earlist initialization for CFE monitor	
	1. Generate & Initialize IPCFG 
	2. Initialize Function Stack 
	3. Initialize Signature Queue 
	4. Set the priority of Application thread: HIGH 
*/
void init_monitor()
{
	printf(" [monitor] monitor_init!\n");
	
	#ifdef ACES_MINIMAL_DEBUG
	printf(" [monitor] monitor_init!\n");
	#endif	

	if(CFE_OCCUR_FLAG == 1)
	{
		printf(" CFE_OCCURS_FLAG ON: pass init_monitor()\n");
		return;
	}

	/* 1. Generate & Initialize IPCFG */
	initialize_monitor_routine(1);


	/* 2. Initialize Function Stack */
	for(int i=0; i<NUMBER_OF_SIGNATURE_QUEUE+2; i++)
	{
		static_InitStack(i);
	}

	/* 3. Initialize Signature Queue */
	signature_queue = signature_queue_set[monitor_process_num];


	/* 4. Set the priority of Application thread: HIGH */

	#ifdef SET_PRIORITY
	int ret;

	pid_t app_pid = getpid();
	pthread_t app_thread = pthread_self();
	struct sched_param params1;
	struct sched_param params2;
	
	params1.sched_priority = sched_get_priority_max(SCHED_FIFO);
	ret = pthread_setschedparam(app_thread, SCHED_FIFO, &params1);

	if(ret !=0)
	{
		printf(" - Failed to pthread_setschedparams\n");
	}

	int policy = 0;
	ret = pthread_getschedparam(app_thread, &policy, &params2);
	policy = sched_getscheduler(app_pid);


	#ifdef SHOW_PRIORITY
	printf(" - This app policy: %d\n", policy);
	printf(" - App thread priority: %d\n", params2.sched_priority);

	printf(" [0] SCEHD_OTHER: %d\n", SCHED_OTHER);
	printf(" [1] SCEHD_FIFO: %d\n", SCHED_FIFO);
	printf(" [2] SCEHD_RR: %d\n", SCHED_RR);
	#endif

	#endif
	
	printf(" [monitor] monitor_init finished!\n");

}


/* 	Name: Monitor_thread_generator */
/*
	1. generate passing data to monitor thread.
	2. generate monitor thread: pthread_create(monitor_routine)
*/
void monitor_thread_generator()
{

	/* 	Initial monitor_thread_function_stack_number: 2 */
	/*
		Application thread has 2 function_stack: 
		[1] App stack with function_stack_number		: 0
		[2] Passing stack with  function_stack_number	: 1

		Monitor thread has more than one function_stack with function_stack_number from starting 2

	*/
	static unsigned int monitor_thread_function_stack_number = 2;


	/* 	No copy, Just Passing */
	/*
		There is a specific signature_queue for each monitor.
	   	Each signature queue for each monitor thread.	
	*/   
	unsigned int* copied_signature_queue = signature_queue;
	unsigned int copied_signature_queue_size = current_queue_size;


	/* 	Generate passing data from Application to monitor thread */
	//monitor_dat* mon_dat = (monitor_dat*)malloc(sizeof(monitor_dat));
	
	monitor_dat* mon_dat = &monitor_dat_set[monitor_thread_function_stack_number-2];
	mon_dat->copied_signature_queue = copied_signature_queue;
	mon_dat->copied_signature_queue_size = copied_signature_queue_size;

	static_copy_stack(1, monitor_thread_function_stack_number);
	mon_dat->function_stack_number = monitor_thread_function_stack_number++; 


	/* 	Monitor thread Generation */
	pthread_create(&mon_thread, NULL, monitor_routine, (void*)mon_dat);


}

/*
	[ enqeue_signature Set ]
	1. enqueue_signature: Branch type
	2. enqueue_signature_with_call : Call type
	3. enqueue_signature_with_return : Return type
	4. enqueue_signature_with_remainder : Program Exit type
*/

void enqueue_signature(int i)
{
	#ifdef ACES_APP_DEBUG
	printf(" [target][%dth] enqueue: 0x%x\n",current_queue_size ,i);
	#endif

	#ifdef CFE_INJECTION_ON
	CFE_INJECTION(CFE_INJECTION_NUMBER++, 2); // branch
	#endif

	signature_queue[current_queue_size] = i;
	current_queue_size++;

	/* 	If signature_queue is full */
	/*
		1. Provoke monitor thread
		2. Select the next signature queue
		3. Stack-Copy from App stack to Passing stack

	*/
	if(current_queue_size == SIGNATURE_QUEUE_SIZE)
	{
		/* 1. Provoke monitor thread */
		monitor_thread_generator();	

		/* 2. Select the next signature queue & Initialization */
		current_queue_size = 0;	
		monitor_process_num++;
		signature_queue = signature_queue_set[monitor_process_num];

		/* 3. Stack-Copy from App stack to Passing stack */
		static_copy_stack(0, 1);
	}

}

void enqueue_signature_with_call(int i)
{
	#ifdef ACES_APP_DEBUG
	printf(" [target][%dth] enqueue with call: 0x%x\n",current_queue_size ,i);
	#endif

	#ifdef CFE_INJECTION_ON
	CFE_INJECTION(CFE_INJECTION_NUMBER++, 1); // call
	#endif

	signature_queue[current_queue_size] = i;
	current_queue_size++;


	/* App Stack PUSH in Call-type BasicBlock */
	static_push(0, i);


	/* 	If signature_queue is full */
	/*
		1. Provoke monitor thread
		2. Select the next signature queue
		3. Stack-Copy from App stack to Passing stack
	*/
	if(current_queue_size == SIGNATURE_QUEUE_SIZE)
	{
		/* 1. Provoke monitor thread */
		monitor_thread_generator();	
		
		/* 2. Select the next signature queue */
		current_queue_size = 0;
		monitor_process_num++;
		signature_queue = signature_queue_set[monitor_process_num];

		/* 3. Stack-Copy from App stack to Passing stack */
		static_copy_stack(0, 1);
	}

}


void enqueue_signature_with_return(int i)
{


	#ifdef ACES_APP_DEBUG
	printf(" [target][%dth] enqueue with return: 0x%x\n",current_queue_size ,i);
	#endif

	#ifdef CFE_INJECTION_ON
	CFE_INJECTION(CFE_INJECTION_NUMBER++, 0); // return
	#endif

	signature_queue[current_queue_size] = i;
	current_queue_size++;
	
	

	/* App Stack POP in Call-type BasicBlock */
	static_pop(0);

	/* 	If signature_queue is full */
	/*
		1. Provoke monitor thread
		2. Select the next signature queue
		3. Stack-Copy from App stack to Passing stack
	*/
	if(current_queue_size == SIGNATURE_QUEUE_SIZE)
	{
		/*	1. Provoke monitor thread */
		monitor_thread_generator();	
		
		/*	2. Select the next signature queue */
		current_queue_size = 0;
		monitor_process_num++;
		signature_queue = signature_queue_set[monitor_process_num];
		
		/*	3. Stack-Copy from App stack to Passing stack */
		static_copy_stack(0, 1);
	}
}

/*
	NOTE: enqueue_signature_with_remainder_process runs in PROGRAM-EXIT-type basicblock.
*/
void enqueue_signature_with_remainder_process(int i)
{
	//current_queue_size =0;

	#ifdef CFE_INJECTION_ON
	CFE_INJECTION(CFE_INJECTION_NUMBER++, 3); // rmd
	#endif

	signature_queue[current_queue_size] = i;
	current_queue_size++;
	
	/* 	If signature_queue is not 1 */
	/*
	   	"The size of signature queue is Not one" means
			-> There is no remaining signature queue.

		Otherwise, There is remaining signature queue.
			-> This should be processed.
		
		(o) 1. Provoke monitor thread
		(x) 2. Select the next signature queue
		(x) 3. Stack-Copy from App stack to Passing stack
	*/
	if(current_queue_size != 1)
	{
		monitor_thread_generator();	
	}
	
	/* For preventing PROGRAM EXIT */
	//while(1);
}






/* Name: dequeue_signature */
unsigned int dequeue_signature(unsigned int* copied_signature_queue, unsigned int deque_pointer)
{
	unsigned int return_node_id;
	return_node_id = copied_signature_queue[deque_pointer];
	
	#ifdef ACES_MON_DEBUG
	printf(" [monitor] dequeue: 0x%x\n", return_node_id);
	#endif
	return return_node_id;
}



/* 	Name: signature_verification */
/*
	1. Initialize node(=current node) with InitValue (InitValue is determined in ..)
	2. Get next node from the current node.
	3. Compare data in the next node with dequeued data from signature queue.
*/   
void signature_verification(
		unsigned int node_id, 
		BBNode** currentBasicBlock,
		unsigned int function_stack_number
		) 
{

	#ifdef ACES_MON_DEBUG
	show_elements(mon_returnPointStack);
	#endif
	BBNode* t_BBNode = (*currentBasicBlock);

	/* Matched */
	if(if_has_connection_move(
				p_integrated_CFG, 
				node_id, 
				currentBasicBlock,
				function_stack_number
				) == true)
	{

		#ifdef ACES_MON_DEBUG
		printf(" [monitor] verification: node(0x%x) to node(0x%x) is OK!\n", t_BBNode->node_id, node_id);
		#endif
		return;
	}

	/* Not Matched */	
	else
	{
		printf(" [Monitor] Found Error!\n");

		FILE* detected = fopen("./detected.rst", "a");

		if(detected == NULL)
		{
			printf(" fopen error!\n");
		}

		fprintf(detected, "Found Error!\n");
		//fputs("Found Error!\n", detected);
		fclose(detected);
		exit(-1);

		return;
	}
}

/*	Name: if_has_connection_move */
/*
   	Search the next node of current node in IPCFG (search_and_change_currentBB)
*/   
bool if_has_connection_move(
		INTEGRATED_CFG* p_integrated_CFG, 
		unsigned int node_id, 
		BBNode** currentBasicBlock,
		unsigned int function_stack_number
		)
{

	/*
		ConnectionType in IPCFG
		- 0: RETURN
		- 1: BRANCH
		- 2: COND_BRANCH
		- 3: CALL
		- 4: MAIN RETURN
	*/


	/* 	Configure Initial Node */
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
	
	/* Type: RETURN */
	else if((*currentBasicBlock)->connectionType == 0)
	{
		#ifdef ACES_DEBUG
		printf("  -BasicBlockType: RETURN(0), input_node_id: 0x%x,\\
			   	current_node_id: 0x%x, connectionArr[0]: 0x%x\n", 
				node_id, (*currentBasicBlock)->node_id, 
				(*currentBasicBlock)->connectionArr[0]);
		#endif
		

		/*
			RETURN Basicblock could have many connectionNode.
		*/


		/* 	Monitor-Stack POP: get returnPoint */
		unsigned int returnPoint = static_pop(function_stack_number);

		#ifdef ACES_MON_DEBUG
		printf(" [stack][monitor] pop: %x\n", returnPoint);
		#endif


		/* 	Search the next node in IPCFG from returnPoint */
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


	}

	/* Type: CALL */
	else if((*currentBasicBlock)->connectionType == 3)
	{
		#ifdef ACES_DEBUG
		printf("  -BasicBlockType: CALL(3), input_node_id: 0x%x, \\
				current_node_id: 0x%x, connectionArr[0]: 0x%x\n", 
				node_id, (*currentBasicBlock)->node_id, 
				(*currentBasicBlock)->connectionArr[0]);
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
			
			static_push(function_stack_number, (*currentBasicBlock)->node_id);

			#ifdef ACES_MON_DEBUG
			printf(" [stack][monitor] push: %x\n", (*currentBasicBlock)->node_id);
			#endif
			search_and_change_currentBB(
					node_id, 
					currentBasicBlock);
		}
	}

	/* Type: BRANCH */
	else if((*currentBasicBlock)->connectionType == 1)
	{

		#ifdef ACES_DEBUG
		printf("  -BasicBlockType: BRANCH(1), input_node_id: 0x%x, \\
				current_node_id: 0x%x, connectionArr[0]: 0x%x\n", 
				node_id, (*currentBasicBlock)->node_id, 
				(*currentBasicBlock)->connectionArr[0]);
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
	
	/* Type: COND_BRANCH */
	else if((*currentBasicBlock)->connectionType == 2)
	{
		#ifdef ACES_DEBUG
		printf("  -BasicBlockType: COND_BRANCH(2), input_node_id: 0x%x, \\
				current_node_id: 0x%x, connectionArr[0]: 0x%x\n", 
				node_id, (*currentBasicBlock)->node_id, 
				(*currentBasicBlock)->connectionArr[0]);
		printf("  -BasicBlockType: COND_BRANCH(2), input_node_id: 0x%x, \\
				current_node_id: 0x%x, connectionArr[1]: 0x%x\n", 
				node_id, (*currentBasicBlock)->node_id, 
				(*currentBasicBlock)->connectionArr[1]);
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

	/* Type: EXIT */
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
		printf("  [node_id]: %x, [node_type]: %d", 
				(*currentBasicBlock)->node_id, 
				(*currentBasicBlock)->connectionType);
		
		return false;
	}
	return true;

}

/* 	Name: seach_and_change_currentBB */
/*
   	Search the next node of current node in IPCFG (search_and_change_currentBB)
*/   
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

	return true;
}



/* 	Name: add_basicblock */
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
		insert(p_integrated_CFG, p_bb);
		#endif

		#ifdef ACES_AVLTREE
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


