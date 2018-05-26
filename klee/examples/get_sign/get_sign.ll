; ModuleID = 'get_sign.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"zero\0A\00", align 1
@.str1 = private unnamed_addr constant [10 x i8] c"negative\0A\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"positive\0A\00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"a\00", align 1

; Function Attrs: nounwind uwtable
define i32 @get_sign(i32 %x) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %x.addr}, metadata !15), !dbg !16
  %0 = load i32* %x.addr, align 4, !dbg !17
  %cmp = icmp eq i32 %0, 0, !dbg !17
  br i1 %cmp, label %if.then, label %if.end, !dbg !17

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0)), !dbg !19
  store i32 0, i32* %retval, !dbg !21
  br label %return, !dbg !21

if.end:                                           ; preds = %entry
  %1 = load i32* %x.addr, align 4, !dbg !22
  %cmp1 = icmp slt i32 %1, 0, !dbg !22
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !22

if.then2:                                         ; preds = %if.end
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str1, i32 0, i32 0)), !dbg !24
  store i32 -1, i32* %retval, !dbg !26
  br label %return, !dbg !26

if.else:                                          ; preds = %if.end
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0)), !dbg !27
  store i32 1, i32* %retval, !dbg !29
  br label %return, !dbg !29

return:                                           ; preds = %if.else, %if.then2, %if.then
  %2 = load i32* %retval, !dbg !30
  ret i32 %2, !dbg !30
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata !{i32* %a}, metadata !31), !dbg !32
  %0 = bitcast i32* %a to i8*, !dbg !33
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0)), !dbg !33
  %1 = load i32* %a, align 4, !dbg !34
  %call = call i32 @get_sign(i32 %1), !dbg !34
  ret i32 %call, !dbg !34
}

declare void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.4 (tags/RELEASE_34/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/shelly/klee/examples/get_sign/get_sign.c] [DW_LANG_C99]
!1 = metadata !{metadata !"get_sign.c", metadata !"/home/shelly/klee/examples/get_sign"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"get_sign", metadata !"get_sign", metadata !"", i32 7, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @get_sign, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 7] [def] [get_sign]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/shelly/klee/examples/get_sign/get_sign.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 23, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 23} ; [ DW_TAG_subprogram ] [line 23] [def] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!13 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!14 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
!15 = metadata !{i32 786689, metadata !4, metadata !"x", metadata !5, i32 16777223, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 7]
!16 = metadata !{i32 7, i32 0, metadata !4, null}
!17 = metadata !{i32 8, i32 0, metadata !18, null} ; [ DW_TAG_imported_declaration ]
!18 = metadata !{i32 786443, metadata !1, metadata !4, i32 8, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/get_sign/get_sign.c]
!19 = metadata !{i32 9, i32 0, metadata !20, null}
!20 = metadata !{i32 786443, metadata !1, metadata !18, i32 8, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/get_sign/get_sign.c]
!21 = metadata !{i32 10, i32 0, metadata !20, null}
!22 = metadata !{i32 13, i32 0, metadata !23, null}
!23 = metadata !{i32 786443, metadata !1, metadata !4, i32 13, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/get_sign/get_sign.c]
!24 = metadata !{i32 14, i32 0, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !23, i32 13, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/get_sign/get_sign.c]
!26 = metadata !{i32 15, i32 0, metadata !25, null}
!27 = metadata !{i32 18, i32 0, metadata !28, null}
!28 = metadata !{i32 786443, metadata !1, metadata !23, i32 17, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/get_sign/get_sign.c]
!29 = metadata !{i32 19, i32 0, metadata !28, null}
!30 = metadata !{i32 21, i32 0, metadata !4, null}
!31 = metadata !{i32 786688, metadata !9, metadata !"a", metadata !5, i32 24, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 24]
!32 = metadata !{i32 24, i32 0, metadata !9, null}
!33 = metadata !{i32 25, i32 0, metadata !9, null}
!34 = metadata !{i32 26, i32 0, metadata !9, null}
