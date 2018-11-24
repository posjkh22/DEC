#include <stdlib.h>
#include "fine_initialize_monitor.h" 

#ifdef ACES_LIST
#include "list/aces_list.h" 

#endif
#ifdef ACES_AVLTREE
#include "tree/aces_avltree.h" 

#endif
#ifdef ACES_HASH
#include "hash/aces_hash.h" 

#endif
struct BBNode;
#ifdef ACES_LIST
struct list;

typedef list INTEGRATED_CFG;
#endif

#ifdef ACES_AVLTREE
struct avl_tree;

typedef avl_tree INTEGRATED_CFG;
#endif

#ifdef ACES_HASH
struct Hash;

typedef Hash INTEGRATED_CFG;
#endif

extern INTEGRATED_CFG* p_integrated_CFG;
extern unsigned int leverage_signature;

INTEGRATED_CFG* generate_path_tree();
void add_basicblock(INTEGRATED_CFG* ,unsigned int, unsigned int, unsigned int, unsigned int);
void initialize_monitor_routine(unsigned int node_id)
{
	p_integrated_CFG = generate_path_tree();
	add_basicblock(p_integrated_CFG, 0x10001, 2, 0x2, 0x10002);
	add_basicblock(p_integrated_CFG, 0x10001, 2, 0x2, 0x10006);
	add_basicblock(p_integrated_CFG, 0x10002, 1, 0x1, 0x10003);
	add_basicblock(p_integrated_CFG, 0x10003, 1, 0x1, 0x10004);
	add_basicblock(p_integrated_CFG, 0x10004, 2, 0x2, 0x10003);
	add_basicblock(p_integrated_CFG, 0x10004, 2, 0x2, 0x10005);
	add_basicblock(p_integrated_CFG, 0x10005, 1, 0x1, 0x10006);
	add_basicblock(p_integrated_CFG, 0x10006, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x10006, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x20001, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x20001, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x30001, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x30001, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x40001, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x40001, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x50001, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x50001, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x60001, 2, 0x2, 0x60002);
	add_basicblock(p_integrated_CFG, 0x60001, 2, 0x2, 0x60004);
	add_basicblock(p_integrated_CFG, 0x60002, 3, 0x2, 0x60001);
	add_basicblock(p_integrated_CFG, 0x60002, 3, 0x2, 0x60003);
	add_basicblock(p_integrated_CFG, 0x60003, 1, 0x1, 0x60004);
	add_basicblock(p_integrated_CFG, 0x60004, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x60004, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x70001, 2, 0x2, 0x70002);
	add_basicblock(p_integrated_CFG, 0x70001, 2, 0x2, 0x70004);
	add_basicblock(p_integrated_CFG, 0x70002, 3, 0x2, 0x70001);
	add_basicblock(p_integrated_CFG, 0x70002, 3, 0x2, 0x70003);
	add_basicblock(p_integrated_CFG, 0x70003, 1, 0x1, 0x70004);
	add_basicblock(p_integrated_CFG, 0x70004, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x70004, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x80001, 1, 0x1, 0x80002);
	add_basicblock(p_integrated_CFG, 0x80002, 2, 0x2, 0x80003);
	add_basicblock(p_integrated_CFG, 0x80002, 2, 0x2, 0x80006);
	add_basicblock(p_integrated_CFG, 0x80003, 1, 0x1, 0x80004);
	add_basicblock(p_integrated_CFG, 0x80004, 1, 0x1, 0x80005);
	add_basicblock(p_integrated_CFG, 0x80005, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x80005, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x80006, 1, 0x1, 0x80007);
	add_basicblock(p_integrated_CFG, 0x80007, 1, 0x1, 0x80008);
	add_basicblock(p_integrated_CFG, 0x80008, 2, 0x2, 0x80009);
	add_basicblock(p_integrated_CFG, 0x80008, 2, 0x2, 0x80017);
	add_basicblock(p_integrated_CFG, 0x80009, 1, 0x1, 0x8000a);
	add_basicblock(p_integrated_CFG, 0x8000a, 1, 0x1, 0x8000b);
	add_basicblock(p_integrated_CFG, 0x8000b, 1, 0x1, 0x8000c);
	add_basicblock(p_integrated_CFG, 0x8000c, 2, 0x2, 0x8000d);
	add_basicblock(p_integrated_CFG, 0x8000c, 2, 0x2, 0x80010);
	add_basicblock(p_integrated_CFG, 0x8000d, 1, 0x1, 0x8000e);
	add_basicblock(p_integrated_CFG, 0x8000e, 1, 0x1, 0x8000f);
	add_basicblock(p_integrated_CFG, 0x8000f, 1, 0x1, 0x8000c);
	add_basicblock(p_integrated_CFG, 0x80010, 1, 0x1, 0x80011);
	add_basicblock(p_integrated_CFG, 0x80011, 2, 0x2, 0x80012);
	add_basicblock(p_integrated_CFG, 0x80011, 2, 0x2, 0x80013);
	add_basicblock(p_integrated_CFG, 0x80012, 1, 0x1, 0x80013);
	add_basicblock(p_integrated_CFG, 0x80013, 2, 0x2, 0x80014);
	add_basicblock(p_integrated_CFG, 0x80013, 2, 0x2, 0x80015);
	add_basicblock(p_integrated_CFG, 0x80014, 1, 0x1, 0x80015);
	add_basicblock(p_integrated_CFG, 0x80015, 1, 0x1, 0x80016);
	add_basicblock(p_integrated_CFG, 0x80016, 1, 0x1, 0x80008);
	add_basicblock(p_integrated_CFG, 0x80017, 1, 0x1, 0x80018);
	add_basicblock(p_integrated_CFG, 0x80018, 1, 0x1, 0x80019);
	add_basicblock(p_integrated_CFG, 0x80019, 1, 0x1, 0x8001a);
	add_basicblock(p_integrated_CFG, 0x8001a, 4, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x8001a, 4, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x100001, 1, 0x1, 0x100002);
	add_basicblock(p_integrated_CFG, 0x100002, 2, 0x2, 0x100003);
	add_basicblock(p_integrated_CFG, 0x100002, 2, 0x2, 0x100004);
	add_basicblock(p_integrated_CFG, 0x100003, 1, 0x1, 0x100004);
	add_basicblock(p_integrated_CFG, 0x100004, 2, 0x2, 0x100005);
	add_basicblock(p_integrated_CFG, 0x100004, 2, 0x2, 0x100007);
	add_basicblock(p_integrated_CFG, 0x100005, 1, 0x1, 0x100006);
	add_basicblock(p_integrated_CFG, 0x100006, 1, 0x1, 0x100002);
	add_basicblock(p_integrated_CFG, 0x100007, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x100007, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x110001, 1, 0x1, 0x110002);
	add_basicblock(p_integrated_CFG, 0x110002, 2, 0x2, 0x110003);
	add_basicblock(p_integrated_CFG, 0x110002, 2, 0x2, 0x110004);
	add_basicblock(p_integrated_CFG, 0x110003, 1, 0x1, 0x110009);
	add_basicblock(p_integrated_CFG, 0x110004, 1, 0x1, 0x110005);
	add_basicblock(p_integrated_CFG, 0x110005, 2, 0x2, 0x110006);
	add_basicblock(p_integrated_CFG, 0x110005, 2, 0x2, 0x110008);
	add_basicblock(p_integrated_CFG, 0x110006, 1, 0x1, 0x110007);
	add_basicblock(p_integrated_CFG, 0x110007, 1, 0x1, 0x110009);
	add_basicblock(p_integrated_CFG, 0x110008, 1, 0x1, 0x110009);
	add_basicblock(p_integrated_CFG, 0x110009, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x110009, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x150001, 2, 0x2, 0x150002);
	add_basicblock(p_integrated_CFG, 0x150001, 2, 0x2, 0x150004);
	add_basicblock(p_integrated_CFG, 0x150002, 1, 0x1, 0x150003);
	add_basicblock(p_integrated_CFG, 0x150003, 1, 0x1, 0x150004);
	add_basicblock(p_integrated_CFG, 0x150004, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x150004, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x170001, 2, 0x2, 0x170002);
	add_basicblock(p_integrated_CFG, 0x170001, 2, 0x2, 0x170004);
	add_basicblock(p_integrated_CFG, 0x170002, 1, 0x1, 0x170003);
	add_basicblock(p_integrated_CFG, 0x170003, 1, 0x1, 0x170004);
	add_basicblock(p_integrated_CFG, 0x170004, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x170004, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x190001, 1, 0x1, 0x190002);
	add_basicblock(p_integrated_CFG, 0x190002, 1, 0x1, 0x190003);
	add_basicblock(p_integrated_CFG, 0x190003, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x190003, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x1b0001, 1, 0x1, 0x1b0002);
	add_basicblock(p_integrated_CFG, 0x1b0002, 2, 0x2, 0x1b0003);
	add_basicblock(p_integrated_CFG, 0x1b0002, 2, 0x2, 0x1b0005);
	add_basicblock(p_integrated_CFG, 0x1b0003, 1, 0x1, 0x1b0004);
	add_basicblock(p_integrated_CFG, 0x1b0004, 1, 0x1, 0x1b0002);
	add_basicblock(p_integrated_CFG, 0x1b0005, 1, 0x1, 0x1b0006);
	add_basicblock(p_integrated_CFG, 0x1b0006, 2, 0x2, 0x1b0007);
	add_basicblock(p_integrated_CFG, 0x1b0006, 2, 0x2, 0x1b000b);
	add_basicblock(p_integrated_CFG, 0x1b0007, 2, 0x2, 0x1b000a);
	add_basicblock(p_integrated_CFG, 0x1b0007, 2, 0x2, 0x1b0008);
	add_basicblock(p_integrated_CFG, 0x1b0008, 2, 0x2, 0x1b0009);
	add_basicblock(p_integrated_CFG, 0x1b0008, 2, 0x2, 0x1b000a);
	add_basicblock(p_integrated_CFG, 0x1b0009, 1, 0x1, 0x1b000a);
	add_basicblock(p_integrated_CFG, 0x1b000a, 1, 0x1, 0x1b0006);
	add_basicblock(p_integrated_CFG, 0x1b000b, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x1b000b, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x1c0001, 1, 0x1, 0x1c0002);
	add_basicblock(p_integrated_CFG, 0x1c0002, 2, 0x2, 0x1c0003);
	add_basicblock(p_integrated_CFG, 0x1c0002, 2, 0x2, 0x1c0006);
	add_basicblock(p_integrated_CFG, 0x1c0003, 2, 0x2, 0x1c0004);
	add_basicblock(p_integrated_CFG, 0x1c0003, 2, 0x2, 0x1c0006);
	add_basicblock(p_integrated_CFG, 0x1c0004, 1, 0x1, 0x1c0005);
	add_basicblock(p_integrated_CFG, 0x1c0005, 1, 0x1, 0x1c0006);
	add_basicblock(p_integrated_CFG, 0x1c0006, 2, 0x2, 0x1c0007);
	add_basicblock(p_integrated_CFG, 0x1c0006, 2, 0x2, 0x1c0008);
	add_basicblock(p_integrated_CFG, 0x1c0007, 1, 0x1, 0x1c0002);
	add_basicblock(p_integrated_CFG, 0x1c0008, 0, 0x2, 0x0);
	add_basicblock(p_integrated_CFG, 0x1c0008, 0, 0x2, 0x0);

	return;
}

INTEGRATED_CFG* generate_path_tree()
{
	p_integrated_CFG = (INTEGRATED_CFG* )malloc(sizeof(INTEGRATED_CFG));
#ifdef ACES_LIST
	init(p_integrated_CFG);
#endif

#ifdef ACES_AVLTREE
	init(p_integrated_CFG);
#endif

#ifdef ACES_HASH
	init(p_integrated_CFG, 100000);
#endif

	BBNode* p_bb_init = (BBNode*)malloc(sizeof(BBNode));
	p_bb_init->node_id = leverage_signature;
	p_bb_init->connectionType = 1;
	p_bb_init->connectionNum = 1;
	p_bb_init->connectionArr = (unsigned int*)malloc(sizeof(unsigned int) * p_bb_init->connectionNum);
	p_bb_init->connectionArr[0] = 0x80001;
#ifdef ACES_LIST
	insert(p_integrated_CFG, p_bb_init);
#endif

#ifdef ACES_AVLTREE
	p_integrated_CFG->root = insert(p_integrated_CFG->root, p_bb_init);
#endif

#ifdef ACES_HASH
	insert(p_integrated_CFG, p_bb_init);
#endif

	return p_integrated_CFG;
}

