; a simple hello masm sample
;RUN-cmd: run ${filename}
;EXPECT-stdout: "hello masm"

.386
DATA SEGMENT USE16
	MESG DB 'hello masm',0AH,'$'
DATA ENDS
CODE SEGMENT USE16
	     ASSUME CS:CODE,DS:DATA
	BEG: MOV    AX,DATA
	     MOV    DS, AX
	     MOV    CX,8
	LAST:MOV    AH,9
	     MOV    DX, OFFSET MESG
	     INT    21H
	     LOOP   LAST
	     MOV    AH,4CH
	     INT    21H            	;BACK TO DOS
CODE ENDS
END  BEG