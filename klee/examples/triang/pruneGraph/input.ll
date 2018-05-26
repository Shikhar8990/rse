; ModuleID = 'input.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"Output: %d \0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @triang(i32 %Side1, i32 %Side2, i32 %Side3) #0 {
entry:
  %retval = alloca i32, align 4
  %Side1.addr = alloca i32, align 4
  %Side2.addr = alloca i32, align 4
  %Side3.addr = alloca i32, align 4
  %triOut = alloca i32, align 4
  store i32 %Side1, i32* %Side1.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %Side1.addr}, metadata !18), !dbg !19
  store i32 %Side2, i32* %Side2.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %Side2.addr}, metadata !20), !dbg !19
  store i32 %Side3, i32* %Side3.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %Side3.addr}, metadata !21), !dbg !19
  call void @llvm.dbg.declare(metadata !{i32* %triOut}, metadata !22), !dbg !23
  %0 = load i32* %Side1.addr, align 4, !dbg !24
  %cmp = icmp sle i32 %0, 0, !dbg !24
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !24

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %Side2.addr, align 4, !dbg !24
  %cmp1 = icmp sle i32 %1, 0, !dbg !24
  br i1 %cmp1, label %if.then, label %lor.lhs.false2, !dbg !24

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32* %Side3.addr, align 4, !dbg !24
  %cmp3 = icmp sle i32 %2, 0, !dbg !24
  br i1 %cmp3, label %if.then, label %if.end, !dbg !24

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store i32 4, i32* %triOut, align 4, !dbg !26
  %3 = load i32* %triOut, align 4, !dbg !28
  store i32 %3, i32* %retval, !dbg !28
  br label %return, !dbg !28

if.end:                                           ; preds = %lor.lhs.false2
  store i32 0, i32* %triOut, align 4, !dbg !29
  %4 = load i32* %Side1.addr, align 4, !dbg !30
  %5 = load i32* %Side2.addr, align 4, !dbg !30
  %cmp4 = icmp eq i32 %4, %5, !dbg !30
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !30

if.then5:                                         ; preds = %if.end
  %6 = load i32* %triOut, align 4, !dbg !32
  %add = add nsw i32 %6, 1, !dbg !32
  store i32 %add, i32* %triOut, align 4, !dbg !32
  br label %if.end6, !dbg !34

if.end6:                                          ; preds = %if.then5, %if.end
  %7 = load i32* %Side1.addr, align 4, !dbg !35
  %8 = load i32* %Side3.addr, align 4, !dbg !35
  %cmp7 = icmp eq i32 %7, %8, !dbg !35
  br i1 %cmp7, label %if.then8, label %if.end10, !dbg !35

if.then8:                                         ; preds = %if.end6
  %9 = load i32* %triOut, align 4, !dbg !37
  %add9 = add nsw i32 %9, 2, !dbg !37
  store i32 %add9, i32* %triOut, align 4, !dbg !37
  br label %if.end10, !dbg !39

if.end10:                                         ; preds = %if.then8, %if.end6
  %10 = load i32* %Side2.addr, align 4, !dbg !40
  %11 = load i32* %Side3.addr, align 4, !dbg !40
  %cmp11 = icmp eq i32 %10, %11, !dbg !40
  br i1 %cmp11, label %if.then12, label %if.end14, !dbg !40

if.then12:                                        ; preds = %if.end10
  %12 = load i32* %triOut, align 4, !dbg !42
  %add13 = add nsw i32 %12, 3, !dbg !42
  store i32 %add13, i32* %triOut, align 4, !dbg !42
  br label %if.end14, !dbg !44

if.end14:                                         ; preds = %if.then12, %if.end10
  %13 = load i32* %triOut, align 4, !dbg !45
  %cmp15 = icmp eq i32 %13, 0, !dbg !45
  br i1 %cmp15, label %if.then16, label %if.end27, !dbg !45

if.then16:                                        ; preds = %if.end14
  %14 = load i32* %Side1.addr, align 4, !dbg !47
  %15 = load i32* %Side2.addr, align 4, !dbg !47
  %add17 = add nsw i32 %14, %15, !dbg !47
  %16 = load i32* %Side3.addr, align 4, !dbg !47
  %cmp18 = icmp sle i32 %add17, %16, !dbg !47
  br i1 %cmp18, label %if.then25, label %lor.lhs.false19, !dbg !47

lor.lhs.false19:                                  ; preds = %if.then16
  %17 = load i32* %Side2.addr, align 4, !dbg !47
  %18 = load i32* %Side3.addr, align 4, !dbg !47
  %add20 = add nsw i32 %17, %18, !dbg !47
  %19 = load i32* %Side1.addr, align 4, !dbg !47
  %cmp21 = icmp sle i32 %add20, %19, !dbg !47
  br i1 %cmp21, label %if.then25, label %lor.lhs.false22, !dbg !47

lor.lhs.false22:                                  ; preds = %lor.lhs.false19
  %20 = load i32* %Side1.addr, align 4, !dbg !47
  %21 = load i32* %Side3.addr, align 4, !dbg !47
  %add23 = add nsw i32 %20, %21, !dbg !47
  %22 = load i32* %Side2.addr, align 4, !dbg !47
  %cmp24 = icmp sle i32 %add23, %22, !dbg !47
  br i1 %cmp24, label %if.then25, label %if.else, !dbg !47

if.then25:                                        ; preds = %lor.lhs.false22, %lor.lhs.false19, %if.then16
  store i32 4, i32* %triOut, align 4, !dbg !50
  br label %if.end26, !dbg !52

if.else:                                          ; preds = %lor.lhs.false22
  store i32 1, i32* %triOut, align 4, !dbg !53
  br label %if.end26

if.end26:                                         ; preds = %if.else, %if.then25
  %23 = load i32* %triOut, align 4, !dbg !55
  store i32 %23, i32* %retval, !dbg !55
  br label %return, !dbg !55

if.end27:                                         ; preds = %if.end14
  %24 = load i32* %triOut, align 4, !dbg !56
  %cmp28 = icmp sgt i32 %24, 3, !dbg !56
  br i1 %cmp28, label %if.then29, label %if.else30, !dbg !56

if.then29:                                        ; preds = %if.end27
  store i32 3, i32* %triOut, align 4, !dbg !58
  br label %if.end51, !dbg !60

if.else30:                                        ; preds = %if.end27
  %25 = load i32* %triOut, align 4, !dbg !61
  %cmp31 = icmp eq i32 %25, 1, !dbg !61
  br i1 %cmp31, label %land.lhs.true, label %if.else35, !dbg !61

land.lhs.true:                                    ; preds = %if.else30
  %26 = load i32* %Side1.addr, align 4, !dbg !61
  %27 = load i32* %Side2.addr, align 4, !dbg !61
  %add32 = add nsw i32 %26, %27, !dbg !61
  %28 = load i32* %Side3.addr, align 4, !dbg !61
  %cmp33 = icmp sgt i32 %add32, %28, !dbg !61
  br i1 %cmp33, label %if.then34, label %if.else35, !dbg !61

if.then34:                                        ; preds = %land.lhs.true
  store i32 2, i32* %triOut, align 4, !dbg !63
  br label %if.end50, !dbg !65

if.else35:                                        ; preds = %land.lhs.true, %if.else30
  %29 = load i32* %triOut, align 4, !dbg !66
  %cmp36 = icmp eq i32 %29, 2, !dbg !66
  br i1 %cmp36, label %land.lhs.true37, label %if.else41, !dbg !66

land.lhs.true37:                                  ; preds = %if.else35
  %30 = load i32* %Side1.addr, align 4, !dbg !66
  %31 = load i32* %Side3.addr, align 4, !dbg !66
  %add38 = add nsw i32 %30, %31, !dbg !66
  %32 = load i32* %Side2.addr, align 4, !dbg !66
  %cmp39 = icmp sgt i32 %add38, %32, !dbg !66
  br i1 %cmp39, label %if.then40, label %if.else41, !dbg !66

if.then40:                                        ; preds = %land.lhs.true37
  store i32 2, i32* %triOut, align 4, !dbg !68
  br label %if.end49, !dbg !70

if.else41:                                        ; preds = %land.lhs.true37, %if.else35
  %33 = load i32* %triOut, align 4, !dbg !71
  %cmp42 = icmp eq i32 %33, 3, !dbg !71
  br i1 %cmp42, label %land.lhs.true43, label %if.else47, !dbg !71

land.lhs.true43:                                  ; preds = %if.else41
  %34 = load i32* %Side2.addr, align 4, !dbg !71
  %35 = load i32* %Side3.addr, align 4, !dbg !71
  %add44 = add nsw i32 %34, %35, !dbg !71
  %36 = load i32* %Side1.addr, align 4, !dbg !71
  %cmp45 = icmp sgt i32 %add44, %36, !dbg !71
  br i1 %cmp45, label %if.then46, label %if.else47, !dbg !71

if.then46:                                        ; preds = %land.lhs.true43
  store i32 2, i32* %triOut, align 4, !dbg !73
  br label %if.end48, !dbg !75

if.else47:                                        ; preds = %land.lhs.true43, %if.else41
  store i32 4, i32* %triOut, align 4, !dbg !76
  br label %if.end48

if.end48:                                         ; preds = %if.else47, %if.then46
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.then40
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %if.then34
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.then29
  %37 = load i32* %triOut, align 4, !dbg !78
  store i32 %37, i32* %retval, !dbg !78
  br label %return, !dbg !78

return:                                           ; preds = %if.end51, %if.end26, %if.then
  %38 = load i32* %retval, !dbg !79
  ret i32 %38, !dbg !79
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %res = alloca i32, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %argc.addr}, metadata !80), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %argv.addr}, metadata !82), !dbg !81
  call void @llvm.dbg.declare(metadata !{i32* %res}, metadata !83), !dbg !84
  %0 = load i8*** %argv.addr, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i8** %0, i64 1, !dbg !84
  %1 = load i8** %arrayidx, align 8, !dbg !84
  %call = call i32 @atoi(i8* %1) #4, !dbg !84
  %2 = load i8*** %argv.addr, align 8, !dbg !84
  %arrayidx1 = getelementptr inbounds i8** %2, i64 2, !dbg !84
  %3 = load i8** %arrayidx1, align 8, !dbg !84
  %call2 = call i32 @atoi(i8* %3) #4, !dbg !84
  %4 = load i8*** %argv.addr, align 8, !dbg !84
  %arrayidx3 = getelementptr inbounds i8** %4, i64 3, !dbg !84
  %5 = load i8** %arrayidx3, align 8, !dbg !84
  %call4 = call i32 @atoi(i8* %5) #4, !dbg !84
  %call5 = call i32 @triang(i32 %call, i32 %call2, i32 %call4), !dbg !84
  store i32 %call5, i32* %res, align 4, !dbg !84
  %6 = load i32* %res, align 4, !dbg !85
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i32 %6), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.4 (tags/RELEASE_34/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c] [DW_LANG_C99]
!1 = metadata !{metadata !"triangle_2.c", metadata !"/home/shelly/klee/examples/triang/pruneGraph"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"triang", metadata !"triang", metadata !"", i32 5, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32, i32)* @triang, null, null, metadata !2, i32 6} ; [ DW_TAG_subprogram ] [line 5] [def] [scope 6] [triang]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 79, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 79} ; [ DW_TAG_subprogram ] [line 79] [def] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !8, metadata !12}
!12 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!14 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!15 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!16 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!17 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
!18 = metadata !{i32 786689, metadata !4, metadata !"Side1", metadata !5, i32 16777221, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Side1] [line 5]
!19 = metadata !{i32 5, i32 0, metadata !4, null}
!20 = metadata !{i32 786689, metadata !4, metadata !"Side2", metadata !5, i32 33554437, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Side2] [line 5]
!21 = metadata !{i32 786689, metadata !4, metadata !"Side3", metadata !5, i32 50331653, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Side3] [line 5]
!22 = metadata !{i32 786688, metadata !4, metadata !"triOut", metadata !5, i32 7, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [triOut] [line 7]
!23 = metadata !{i32 7, i32 0, metadata !4, null}
!24 = metadata !{i32 17, i32 0, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !4, i32 17, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!26 = metadata !{i32 20, i32 0, metadata !27, null}
!27 = metadata !{i32 786443, metadata !1, metadata !25, i32 18, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!28 = metadata !{i32 21, i32 0, metadata !27, null}
!29 = metadata !{i32 24, i32 0, metadata !4, null}
!30 = metadata !{i32 25, i32 0, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !4, i32 25, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!32 = metadata !{i32 27, i32 0, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !31, i32 25, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!34 = metadata !{i32 28, i32 0, metadata !33, null}
!35 = metadata !{i32 29, i32 0, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !4, i32 29, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!37 = metadata !{i32 31, i32 0, metadata !38, null}
!38 = metadata !{i32 786443, metadata !1, metadata !36, i32 29, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!39 = metadata !{i32 32, i32 0, metadata !38, null}
!40 = metadata !{i32 33, i32 0, metadata !41, null}
!41 = metadata !{i32 786443, metadata !1, metadata !4, i32 33, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!42 = metadata !{i32 35, i32 0, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !41, i32 33, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!44 = metadata !{i32 36, i32 0, metadata !43, null}
!45 = metadata !{i32 37, i32 0, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !4, i32 37, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!47 = metadata !{i32 41, i32 0, metadata !48, null}
!48 = metadata !{i32 786443, metadata !1, metadata !49, i32 41, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!49 = metadata !{i32 786443, metadata !1, metadata !46, i32 38, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!50 = metadata !{i32 44, i32 0, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !48, i32 42, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!52 = metadata !{i32 45, i32 0, metadata !51, null}
!53 = metadata !{i32 48, i32 0, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !48, i32 46, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!55 = metadata !{i32 50, i32 0, metadata !49, null}
!56 = metadata !{i32 56, i32 0, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !4, i32 56, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!58 = metadata !{i32 58, i32 0, metadata !59, null} ; [ DW_TAG_imported_module ]
!59 = metadata !{i32 786443, metadata !1, metadata !57, i32 56, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!60 = metadata !{i32 59, i32 0, metadata !59, null}
!61 = metadata !{i32 60, i32 0, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !57, i32 60, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!63 = metadata !{i32 62, i32 0, metadata !64, null}
!64 = metadata !{i32 786443, metadata !1, metadata !62, i32 60, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!65 = metadata !{i32 63, i32 0, metadata !64, null}
!66 = metadata !{i32 64, i32 0, metadata !67, null}
!67 = metadata !{i32 786443, metadata !1, metadata !62, i32 64, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!68 = metadata !{i32 66, i32 0, metadata !69, null}
!69 = metadata !{i32 786443, metadata !1, metadata !67, i32 64, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!70 = metadata !{i32 67, i32 0, metadata !69, null}
!71 = metadata !{i32 68, i32 0, metadata !72, null}
!72 = metadata !{i32 786443, metadata !1, metadata !67, i32 68, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!73 = metadata !{i32 70, i32 0, metadata !74, null}
!74 = metadata !{i32 786443, metadata !1, metadata !72, i32 68, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!75 = metadata !{i32 71, i32 0, metadata !74, null}
!76 = metadata !{i32 74, i32 0, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !72, i32 72, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/pruneGraph/triangle_2.c]
!78 = metadata !{i32 76, i32 0, metadata !4, null}
!79 = metadata !{i32 77, i32 0, metadata !4, null}
!80 = metadata !{i32 786689, metadata !9, metadata !"argc", metadata !5, i32 16777295, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 79]
!81 = metadata !{i32 79, i32 0, metadata !9, null}
!82 = metadata !{i32 786689, metadata !9, metadata !"argv", metadata !5, i32 33554511, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 79]
!83 = metadata !{i32 786688, metadata !9, metadata !"res", metadata !5, i32 80, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 80]
!84 = metadata !{i32 80, i32 0, metadata !9, null}
!85 = metadata !{i32 81, i32 0, metadata !9, null}
!86 = metadata !{i32 82, i32 0, metadata !9, null}
