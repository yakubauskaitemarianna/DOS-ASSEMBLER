@echo on
../COMPILE/MASM.EXE /ZI main.asm,,,;
../COMPILE/MASM.EXE /ZI input.asm,,,;
../COMPILE/MASM.EXE /ZI menu.asm,,,;
../COMPILE/MASM.EXE /ZI out2s.asm,,,;
../COMPILE/MASM.EXE /ZI out10s.asm,,,;
../COMPILE/MASM.EXE /ZI out2.asm,,,;
../COMPILE/MASM.EXE /ZI out10.asm,,,;
../COMPILE/MASM.EXE /ZI out16.asm,,,;
../COMPILE/MASM.EXE /ZI out16s.asm,,,;

../COMPILE/link.exe /CO main.OBJ input.OBJ menu.OBJ out2s.OBJ out10s.OBJ out2.OBJ out10.OBJ out16.OBJ out16s.OBJ,,,;

DEL *.OBJ *.LST *.CRF *.MAP

../COMPILE/CV.EXE main.EXE