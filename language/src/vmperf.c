/* Copyright (c) 2013-2024 Mahmoud Fayed <msfclipper@yahoo.com> */

#include "ring.h"

void ring_vm_pushp ( VM *pVM )
{
	RING_VM_STACK_PUSHP ;
	RING_VM_STACK_OBJTYPE = RING_OBJTYPE_VARIABLE ;
	/* Update Scope Information */
	if ( pVM->nLoadAddressScope  == RING_VARSCOPE_NOTHING ) {
		pVM->nLoadAddressScope = RING_VARSCOPE_GLOBAL ;
	}
	pVM->nVarScope = RING_VARSCOPE_GLOBAL ;
	/* Check lNewRef Flag */
	ring_list_resetlnewref((List *) RING_VM_STACK_READP);
}

void ring_vm_pushplocal ( VM *pVM )
{
	/* Check Scope Life Time */
	if ( RING_VM_IR_GETINTREG != pVM->nActiveScopeID ) {
		/* Reset register used for the pointer */
		RING_VM_IR_READIVALUE(RING_VM_IR_REG2) = 0 ;
		RING_VM_IR_SETREG2TYPE(RING_VM_REGTYPE_INT);
		RING_VM_IR_OPCODE = ICO_LOADADDRESS ;
		ring_vm_loadaddress(pVM);
		return ;
	}
	RING_VM_STACK_PUSHPVALUE(RING_VM_IR_READPVALUE(RING_VM_IR_REG2)) ;
	RING_VM_STACK_OBJTYPE = RING_OBJTYPE_VARIABLE ;
	/* Update Scope Information */
	if ( pVM->nLoadAddressScope  == RING_VARSCOPE_NOTHING ) {
		pVM->nLoadAddressScope = RING_VARSCOPE_LOCAL ;
	}
	pVM->nVarScope = RING_VARSCOPE_LOCAL ;
	/* Check lNewRef Flag */
	ring_list_resetlnewref((List *) RING_VM_STACK_READP);
}

void ring_vm_incp ( VM *pVM )
{
	List *pVar  ;
	pVar = (List *) RING_VM_IR_READP ;
	ring_list_setdouble_gc(pVM->pRingState,pVar,RING_VAR_VALUE,ring_list_getdouble(pVar,RING_VAR_VALUE) + 1);
}

void ring_vm_pushpv ( VM *pVM )
{
	ring_vm_pushp(pVM);
	ring_vm_varpushv(pVM);
}

void ring_vm_incjump ( VM *pVM )
{
	List *pVar  ;
	Item *pItem  ;
	double nNum1,nNum2  ;
	int nLine  ;
	if ( ring_vm_findvar(pVM, RING_VM_IR_READC ) == 0 ) {
		ring_vm_newvar(pVM, RING_VM_IR_READC);
	}
	pVar = (List *) RING_VM_STACK_READP ;
	RING_VM_STACK_POP ;
	pItem = ring_list_getitem(pVar,RING_VAR_VALUE) ;
	nNum1 = ring_list_getdouble(pVM->pForStep,ring_list_getsize(pVM->pForStep));
	/* Check Data */
	if ( ! ring_list_isnumber(pVar,RING_VAR_VALUE) ) {
		ring_vm_error(pVM,RING_VM_ERROR_FORLOOPDATATYPE);
		return ;
	}
	nNum2 = ring_list_getdouble(pVar,RING_VAR_VALUE) ;
	ring_list_setdouble_gc(pVM->pRingState,pVar,RING_VAR_VALUE,nNum2 +nNum1);
	/* Move line number to REG2 (HIGH) */
	RING_VM_IR_LOAD ;
	nLine = RING_VM_IR_READIVALUE(RING_VM_IR_REG1) ;
	RING_VM_IR_UNLOAD ;
	RING_VM_IR_READHIGHIVALUE(RING_VM_IR_REG2) = nLine ;
	/* Change Instruction for Performance */
	if ( pVM->nVarScope == RING_VARSCOPE_GLOBAL ) {
		/* Replace ICO_INCJUMP with IncPJUMP for better performance */
		if ( nNum1 == 1.0 ) {
			RING_VM_IR_OPCODE = ICO_INCPJUMPSTEP1 ;
		}
		else {
			RING_VM_IR_OPCODE = ICO_INCPJUMP ;
		}
		RING_VM_IR_ITEMSETPOINTER(RING_VM_IR_ITEM(RING_VM_IR_REG3),pItem);
		RING_VM_IR_SETREG3TYPE(RING_VM_REGTYPE_POINTER);
	}
	else if ( pVM->nVarScope == RING_VARSCOPE_LOCAL ) {
		/* Replace ICO_INCJUMP with IncLPJUMP for better performance */
		if ( nNum1 == 1.0 ) {
			RING_VM_IR_OPCODE = ICO_INCLPJUMPSTEP1 ;
		}
		else {
			RING_VM_IR_OPCODE = ICO_INCLPJUMP ;
		}
		RING_VM_IR_ITEMSETPOINTER(RING_VM_IR_ITEM(RING_VM_IR_REG3),pItem);
		RING_VM_IR_SETINTREG(pVM->nActiveScopeID);
		RING_VM_IR_SETREG3TYPE(RING_VM_REGTYPE_POINTER);
	}
	/* Jump */
	pVM->nPC = RING_VM_IR_READIVALUE(RING_VM_IR_REG2) ;
	RING_VM_STACK_PUSHNVALUE(ring_list_getdouble(pVar,RING_VAR_VALUE));
	RING_VM_IR_SETLINENUMBER(nLine);
}

void ring_vm_incpjump ( VM *pVM )
{
	Item *pItem  ;
	double nNum1,nNum2  ;
	pItem = (Item *) RING_VM_IR_READPVALUE(RING_VM_IR_REG3) ;
	nNum1 = ring_list_getdouble(pVM->pForStep,ring_list_getsize(pVM->pForStep));
	/* Check Data */
	if ( ! ring_item_isdouble(pItem) ) {
		ring_vm_error(pVM,RING_VM_ERROR_FORLOOPDATATYPE);
		return ;
	}
	nNum2 = ring_item_getdouble(pItem) ;
	ring_item_setdouble_gc(pVM->pRingState,pItem,nNum2 + nNum1);
	/* Jump */
	pVM->nPC = RING_VM_IR_READIVALUE(RING_VM_IR_REG2) ;
	RING_VM_STACK_PUSHNVALUE(ring_item_getdouble(pItem));
	RING_VM_IR_SETLINENUMBER(RING_VM_IR_READHIGHIVALUE(RING_VM_IR_REG2));
}

void ring_vm_inclpjump ( VM *pVM )
{
	/* Check Scope Life Time */
	if ( RING_VM_IR_GETINTREG != pVM->nActiveScopeID ) {
		/* Move line number from REG2 To REG3 */
		RING_VM_IR_READIVALUE(RING_VM_IR_REG3) = RING_VM_IR_READHIGHIVALUE(RING_VM_IR_REG2) ;
		RING_VM_IR_SETREG3TYPE(RING_VM_REGTYPE_INT);
		ring_vm_incjump(pVM);
		return ;
	}
	ring_vm_incpjump(pVM);
}

void ring_vm_loadfuncp ( VM *pVM )
{
	FuncCall *pFuncCall  ;
	/* Check not defining a Ring function that replace a C function */
	if ( (RING_VM_IR_GETFLAGREG == RING_FUNCTYPE_C) && (ring_list_getsize(pVM->pFunctionsMap) != RING_VM_IR_READHIGHIVALUE(RING_VM_IR_REG2)) ) {
		ring_vm_loadfunc(pVM);
		return ;
	}
	pVM->nFuncExecute++ ;
	/* Add FuncCall Structure */
	pFuncCall = ring_vmfunccall_new(pVM);
	pFuncCall->nType = RING_VM_IR_GETFLAGREG ;
	pFuncCall->cName = RING_VM_IR_READC ;
	pFuncCall->nPC = RING_VM_IR_READLOWIVALUE(RING_VM_IR_REG2) ;
	pFuncCall->nSP = pVM->nSP ;
	pFuncCall->nLineNumber = RING_VM_IR_GETLINENUMBER ;
	pFuncCall->pFunc = (void(*)(void *)) RING_VM_IR_READPVALUE(RING_VM_IR_REG3) ;
	pFuncCall->pTempMem = ring_list_new_gc(pVM->pRingState,RING_ZERO) ;
	/* Store the file name */
	pFuncCall->cFileName = pVM->cFileName ;
	if ( pFuncCall->nType == RING_FUNCTYPE_SCRIPT ) {
		pVM->cPrevFileName = pVM->cFileName ;
	}
	pFuncCall->cNewFileName = pVM->cFileName ;
	/* Method/Function & Scope */
	pFuncCall->lMethod = RING_VM_IR_GETINTREG ;
	pFuncCall->nLoadAddressScope = pVM->nLoadAddressScope ;
	pVM->nLoadAddressScope = RING_VARSCOPE_NOTHING ;
	/* Store List information */
	pFuncCall->nListStart = pVM->nListStart ;
	pFuncCall->pNestedLists = pVM->pNestedLists ;
	pVM->nListStart = 0 ;
	pVM->pNestedLists = ring_list_new_gc(pVM->pRingState,RING_ZERO);
}

void ring_vm_incpjumpstep1 ( VM *pVM )
{
	Item *pItem  ;
	pItem = (Item *) RING_VM_IR_READPVALUE(RING_VM_IR_REG3) ;
	/* Jump */
	pVM->nPC = RING_VM_IR_READIVALUE(RING_VM_IR_REG2) ;
	/* Check Data */
	if ( ! ring_item_isdouble(pItem) ) {
		ring_vm_error(pVM,RING_VM_ERROR_FORLOOPDATATYPE);
		return ;
	}
	RING_VM_STACK_PUSHNVALUE(ring_item_incdouble(pItem));
	RING_VM_IR_SETLINENUMBER(RING_VM_IR_READHIGHIVALUE(RING_VM_IR_REG2));
}

void ring_vm_inclpjumpstep1 ( VM *pVM )
{
	/* Check Scope Life Time */
	if ( RING_VM_IR_GETINTREG != pVM->nActiveScopeID ) {
		ring_vm_incjump(pVM);
		return ;
	}
	ring_vm_incpjumpstep1(pVM);
}

void ring_vm_setopcode ( VM *pVM )
{
	int nIns,nOPCode  ;
	nIns = RING_VM_IR_READIVALUE(RING_VM_IR_REG2) - 1 ;
	nOPCode = RING_VM_IR_READI ;
	RING_VM_IR_OPCODEVALUE(nIns) = nOPCode ;
}
