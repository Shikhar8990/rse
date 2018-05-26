; ModuleID = 'triangle.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"Code: %d\00", align 1
@.str4 = private unnamed_addr constant [12 x i8] c"klee_choose\00", align 1
@.str15 = private unnamed_addr constant [58 x i8] c"/home/shelly/klee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str12 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str26 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str37 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str25 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str6 = private unnamed_addr constant [49 x i8] c"/home/shelly/klee/runtime/Intrinsic/klee_range.c\00", align 1
@.str17 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str28 = private unnamed_addr constant [5 x i8] c"user\00", align 1

; Function Attrs: nounwind uwtable
define i32 @triang(i32 %Side1, i32 %Side2, i32 %Side3) #0 {
entry:
  %retval = alloca i32, align 4
  %Side1.addr = alloca i32, align 4
  %Side2.addr = alloca i32, align 4
  %Side3.addr = alloca i32, align 4
  %triOut = alloca i32, align 4
  store i32 %Side1, i32* %Side1.addr, align 4
  store i32 %Side2, i32* %Side2.addr, align 4
  store i32 %Side3, i32* %Side3.addr, align 4
  %0 = load i32* %Side1.addr, align 4, !dbg !134
  %cmp = icmp sle i32 %0, 0, !dbg !134
  %1 = load i32* %Side2.addr, align 4, !dbg !134
  %cmp1 = icmp sle i32 %1, 0, !dbg !134
  %or.cond = or i1 %cmp, %cmp1, !dbg !134
  %2 = load i32* %Side3.addr, align 4, !dbg !134
  %cmp3 = icmp sle i32 %2, 0, !dbg !134
  %or.cond1 = or i1 %or.cond, %cmp3, !dbg !134
  br i1 %or.cond1, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %entry
  store i32 4, i32* %triOut, align 4, !dbg !136
  %3 = load i32* %triOut, align 4, !dbg !138
  store i32 %3, i32* %retval, !dbg !138
  br label %return, !dbg !138

if.end:                                           ; preds = %entry
  store i32 0, i32* %triOut, align 4, !dbg !139
  %4 = load i32* %Side1.addr, align 4, !dbg !140
  %5 = load i32* %Side2.addr, align 4, !dbg !140
  %cmp4 = icmp eq i32 %4, %5, !dbg !140
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !140

if.then5:                                         ; preds = %if.end
  %6 = load i32* %triOut, align 4, !dbg !142
  %add = add nsw i32 %6, 1, !dbg !142
  store i32 %add, i32* %triOut, align 4, !dbg !142
  br label %if.end6, !dbg !142

if.end6:                                          ; preds = %if.then5, %if.end
  %7 = load i32* %Side1.addr, align 4, !dbg !143
  %8 = load i32* %Side3.addr, align 4, !dbg !143
  %cmp7 = icmp eq i32 %7, %8, !dbg !143
  br i1 %cmp7, label %if.then8, label %if.end10, !dbg !143

if.then8:                                         ; preds = %if.end6
  %9 = load i32* %triOut, align 4, !dbg !145
  %add9 = add nsw i32 %9, 2, !dbg !145
  store i32 %add9, i32* %triOut, align 4, !dbg !145
  br label %if.end10, !dbg !145

if.end10:                                         ; preds = %if.then8, %if.end6
  %10 = load i32* %Side2.addr, align 4, !dbg !146
  %11 = load i32* %Side3.addr, align 4, !dbg !146
  %cmp11 = icmp eq i32 %10, %11, !dbg !146
  br i1 %cmp11, label %if.then12, label %if.end14, !dbg !146

if.then12:                                        ; preds = %if.end10
  %12 = load i32* %triOut, align 4, !dbg !148
  %add13 = add nsw i32 %12, 3, !dbg !148
  store i32 %add13, i32* %triOut, align 4, !dbg !148
  br label %if.end14, !dbg !148

if.end14:                                         ; preds = %if.then12, %if.end10
  %13 = load i32* %triOut, align 4, !dbg !149
  %cmp15 = icmp eq i32 %13, 0, !dbg !149
  br i1 %cmp15, label %if.then16, label %if.end27, !dbg !149

if.then16:                                        ; preds = %if.end14
  %14 = load i32* %Side1.addr, align 4, !dbg !151
  %15 = load i32* %Side2.addr, align 4, !dbg !151
  %add17 = add nsw i32 %14, %15, !dbg !151
  %16 = load i32* %Side3.addr, align 4, !dbg !151
  %cmp18 = icmp sle i32 %add17, %16, !dbg !151
  br i1 %cmp18, label %if.then25, label %lor.lhs.false19, !dbg !151

lor.lhs.false19:                                  ; preds = %if.then16
  %17 = load i32* %Side2.addr, align 4, !dbg !151
  %18 = load i32* %Side3.addr, align 4, !dbg !151
  %add20 = add nsw i32 %17, %18, !dbg !151
  %19 = load i32* %Side1.addr, align 4, !dbg !151
  %cmp21 = icmp sle i32 %add20, %19, !dbg !151
  br i1 %cmp21, label %if.then25, label %lor.lhs.false22, !dbg !151

lor.lhs.false22:                                  ; preds = %lor.lhs.false19
  %20 = load i32* %Side1.addr, align 4, !dbg !151
  %21 = load i32* %Side3.addr, align 4, !dbg !151
  %add23 = add nsw i32 %20, %21, !dbg !151
  %22 = load i32* %Side2.addr, align 4, !dbg !151
  %cmp24 = icmp sle i32 %add23, %22, !dbg !151
  br i1 %cmp24, label %if.then25, label %if.else, !dbg !151

if.then25:                                        ; preds = %lor.lhs.false22, %lor.lhs.false19, %if.then16
  store i32 4, i32* %triOut, align 4, !dbg !154
  br label %if.end26, !dbg !154

if.else:                                          ; preds = %lor.lhs.false22
  store i32 1, i32* %triOut, align 4, !dbg !155
  br label %if.end26

if.end26:                                         ; preds = %if.else, %if.then25
  %23 = load i32* %triOut, align 4, !dbg !156
  store i32 %23, i32* %retval, !dbg !156
  br label %return, !dbg !156

if.end27:                                         ; preds = %if.end14
  %24 = load i32* %triOut, align 4, !dbg !157
  %cmp28 = icmp sgt i32 %24, 3, !dbg !157
  br i1 %cmp28, label %if.then29, label %if.else30, !dbg !157

if.then29:                                        ; preds = %if.end27
  store i32 3, i32* %triOut, align 4, !dbg !159
  br label %if.end51, !dbg !159

if.else30:                                        ; preds = %if.end27
  %25 = load i32* %triOut, align 4, !dbg !160
  %cmp31 = icmp eq i32 %25, 1, !dbg !160
  br i1 %cmp31, label %land.lhs.true, label %if.else35, !dbg !160

land.lhs.true:                                    ; preds = %if.else30
  %26 = load i32* %Side1.addr, align 4, !dbg !160
  %27 = load i32* %Side2.addr, align 4, !dbg !160
  %add32 = add nsw i32 %26, %27, !dbg !160
  %28 = load i32* %Side3.addr, align 4, !dbg !160
  %cmp33 = icmp sgt i32 %add32, %28, !dbg !160
  br i1 %cmp33, label %if.then34, label %if.else35, !dbg !160

if.then34:                                        ; preds = %land.lhs.true
  store i32 2, i32* %triOut, align 4, !dbg !162
  br label %if.end51, !dbg !162

if.else35:                                        ; preds = %land.lhs.true, %if.else30
  %29 = load i32* %triOut, align 4, !dbg !163
  %cmp36 = icmp eq i32 %29, 2, !dbg !163
  br i1 %cmp36, label %land.lhs.true37, label %if.else41, !dbg !163

land.lhs.true37:                                  ; preds = %if.else35
  %30 = load i32* %Side1.addr, align 4, !dbg !163
  %31 = load i32* %Side3.addr, align 4, !dbg !163
  %add38 = add nsw i32 %30, %31, !dbg !163
  %32 = load i32* %Side2.addr, align 4, !dbg !163
  %cmp39 = icmp sgt i32 %add38, %32, !dbg !163
  br i1 %cmp39, label %if.then40, label %if.else41, !dbg !163

if.then40:                                        ; preds = %land.lhs.true37
  store i32 2, i32* %triOut, align 4, !dbg !165
  br label %if.end51, !dbg !165

if.else41:                                        ; preds = %land.lhs.true37, %if.else35
  %33 = load i32* %triOut, align 4, !dbg !166
  %cmp42 = icmp eq i32 %33, 3, !dbg !166
  br i1 %cmp42, label %land.lhs.true43, label %if.else47, !dbg !166

land.lhs.true43:                                  ; preds = %if.else41
  %34 = load i32* %Side2.addr, align 4, !dbg !166
  %35 = load i32* %Side3.addr, align 4, !dbg !166
  %add44 = add nsw i32 %34, %35, !dbg !166
  %36 = load i32* %Side1.addr, align 4, !dbg !166
  %cmp45 = icmp sgt i32 %add44, %36, !dbg !166
  br i1 %cmp45, label %if.then46, label %if.else47, !dbg !166

if.then46:                                        ; preds = %land.lhs.true43
  store i32 2, i32* %triOut, align 4, !dbg !168
  br label %if.end51, !dbg !168

if.else47:                                        ; preds = %land.lhs.true43, %if.else41
  store i32 4, i32* %triOut, align 4, !dbg !169
  br label %if.end51

if.end51:                                         ; preds = %if.then34, %if.then46, %if.else47, %if.then40, %if.then29
  %37 = load i32* %triOut, align 4, !dbg !170
  store i32 %37, i32* %retval, !dbg !170
  br label %return, !dbg !170

return:                                           ; preds = %if.end51, %if.end26, %if.then
  %38 = load i32* %retval, !dbg !171
  ret i32 %38, !dbg !171
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %res = alloca i32, align 4
  %0 = bitcast i32* %a to i8*, !dbg !172
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !172
  %1 = bitcast i32* %b to i8*, !dbg !173
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)), !dbg !173
  %2 = bitcast i32* %c to i8*, !dbg !174
  call void @klee_make_symbolic(i8* %2, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !174
  %3 = load i32* %a, align 4, !dbg !175
  %4 = load i32* %b, align 4, !dbg !175
  %5 = load i32* %c, align 4, !dbg !175
  %call = call i32 @triang(i32 %3, i32 %4, i32 %5), !dbg !175
  store i32 %call, i32* %res, align 4, !dbg !175
  %6 = load i32* %res, align 4, !dbg !176
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0), i32 %6), !dbg !176
  ret i32 0, !dbg !177
}

declare void @klee_make_symbolic(i8*, i64, i8*) #2

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i64 @klee_choose(i64 %n) #3 {
entry:
  %x = alloca i64, align 8
  %0 = bitcast i64* %x to i8*, !dbg !178
  call void @klee_make_symbolic(i8* %0, i64 8, i8* getelementptr inbounds ([12 x i8]* @.str4, i64 0, i64 0)) #6, !dbg !178
  %1 = load i64* %x, align 8, !dbg !179, !tbaa !181
  %cmp = icmp ult i64 %1, %n, !dbg !179
  br i1 %cmp, label %if.end, label %if.then, !dbg !179

if.then:                                          ; preds = %entry
  call void @klee_silent_exit(i32 0) #7, !dbg !185
  unreachable, !dbg !185

if.end:                                           ; preds = %entry
  ret i64 %1, !dbg !186
}

; Function Attrs: noreturn
declare void @klee_silent_exit(i32) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #3 {
entry:
  %cmp = icmp eq i64 %z, 0, !dbg !187
  br i1 %cmp, label %if.then, label %if.end, !dbg !187

if.then:                                          ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([58 x i8]* @.str15, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str12, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str26, i64 0, i64 0)) #7, !dbg !189
  unreachable, !dbg !189

if.end:                                           ; preds = %entry
  ret void, !dbg !190
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #4

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #3 {
entry:
  %x = alloca i32, align 4
  %0 = bitcast i32* %x to i8*, !dbg !191
  call void @klee_make_symbolic(i8* %0, i64 4, i8* %name) #6, !dbg !191
  %1 = load i32* %x, align 4, !dbg !192, !tbaa !193
  ret i32 %1, !dbg !192
}

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #3 {
entry:
  %cmp = icmp ult i64 %shift, %bitWidth, !dbg !195
  br i1 %cmp, label %if.end, label %if.then, !dbg !195

if.then:                                          ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str37, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #7, !dbg !197
  unreachable, !dbg !197

if.end:                                           ; preds = %entry
  ret void, !dbg !199
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #3 {
entry:
  %x = alloca i32, align 4
  %cmp = icmp slt i32 %start, %end, !dbg !200
  br i1 %cmp, label %if.end, label %if.then, !dbg !200

if.then:                                          ; preds = %entry
  call void @klee_report_error(i8* getelementptr inbounds ([49 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #7, !dbg !202
  unreachable, !dbg !202

if.end:                                           ; preds = %entry
  %add = add nsw i32 %start, 1, !dbg !203
  %cmp1 = icmp eq i32 %add, %end, !dbg !203
  br i1 %cmp1, label %return, label %if.else, !dbg !203

if.else:                                          ; preds = %if.end
  %0 = bitcast i32* %x to i8*, !dbg !205
  call void @klee_make_symbolic(i8* %0, i64 4, i8* %name) #6, !dbg !205
  %cmp3 = icmp eq i32 %start, 0, !dbg !207
  %1 = load i32* %x, align 4, !dbg !209, !tbaa !193
  br i1 %cmp3, label %if.then4, label %if.else7, !dbg !207

if.then4:                                         ; preds = %if.else
  %cmp5 = icmp ult i32 %1, %end, !dbg !209
  %conv6 = zext i1 %cmp5 to i64, !dbg !209
  call void @klee_assume(i64 %conv6) #6, !dbg !209
  br label %if.end14, !dbg !211

if.else7:                                         ; preds = %if.else
  %cmp8 = icmp sge i32 %1, %start, !dbg !212
  %conv10 = zext i1 %cmp8 to i64, !dbg !212
  call void @klee_assume(i64 %conv10) #6, !dbg !212
  %2 = load i32* %x, align 4, !dbg !214, !tbaa !193
  %cmp11 = icmp slt i32 %2, %end, !dbg !214
  %conv13 = zext i1 %cmp11 to i64, !dbg !214
  call void @klee_assume(i64 %conv13) #6, !dbg !214
  br label %if.end14

if.end14:                                         ; preds = %if.else7, %if.then4
  %3 = load i32* %x, align 4, !dbg !215, !tbaa !193
  br label %return, !dbg !215

return:                                           ; preds = %if.end14, %if.end
  %retval.0 = phi i32 [ %3, %if.end14 ], [ %start, %if.end ]
  ret i32 %retval.0, !dbg !216
}

declare void @klee_assume(i64) #5

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #3 {
entry:
  %cmp3 = icmp eq i64 %len, 0, !dbg !217
  br i1 %cmp3, label %while.end, label %while.body.preheader, !dbg !217

while.body.preheader:                             ; preds = %entry
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %0 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %while.body.preheader
  %scevgep7 = getelementptr i8* %srcaddr, i64 %0
  %scevgep = getelementptr i8* %destaddr, i64 %0
  %bound1 = icmp uge i8* %scevgep, %srcaddr
  %bound0 = icmp uge i8* %scevgep7, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end9 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep106 = getelementptr i8* %destaddr, i64 %index
  %1 = bitcast i8* %next.gep to <16 x i8>*, !dbg !218
  %wide.load = load <16 x i8>* %1, align 1, !dbg !218
  %next.gep.sum282 = or i64 %index, 16, !dbg !218
  %2 = getelementptr i8* %srcaddr, i64 %next.gep.sum282, !dbg !218
  %3 = bitcast i8* %2 to <16 x i8>*, !dbg !218
  %wide.load203 = load <16 x i8>* %3, align 1, !dbg !218
  %4 = bitcast i8* %next.gep106 to <16 x i8>*, !dbg !218
  store <16 x i8> %wide.load, <16 x i8>* %4, align 1, !dbg !218
  %next.gep106.sum299 = or i64 %index, 16, !dbg !218
  %5 = getelementptr i8* %destaddr, i64 %next.gep106.sum299, !dbg !218
  %6 = bitcast i8* %5 to <16 x i8>*, !dbg !218
  store <16 x i8> %wide.load203, <16 x i8>* %6, align 1, !dbg !218
  %index.next = add i64 %index, 32
  %7 = icmp eq i64 %index.next, %n.vec
  br i1 %7, label %middle.block, label %vector.body, !llvm.loop !219

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %while.body.preheader
  %resume.val = phi i8* [ %srcaddr, %while.body.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val8 = phi i8* [ %destaddr, %while.body.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end9, %vector.body ]
  %resume.val10 = phi i64 [ %len, %while.body.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %while.body.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %while.end, label %while.body

while.body:                                       ; preds = %while.body, %middle.block
  %src.06 = phi i8* [ %incdec.ptr, %while.body ], [ %resume.val, %middle.block ]
  %dest.05 = phi i8* [ %incdec.ptr1, %while.body ], [ %resume.val8, %middle.block ]
  %len.addr.04 = phi i64 [ %dec, %while.body ], [ %resume.val10, %middle.block ]
  %dec = add i64 %len.addr.04, -1, !dbg !217
  %incdec.ptr = getelementptr inbounds i8* %src.06, i64 1, !dbg !218
  %8 = load i8* %src.06, align 1, !dbg !218, !tbaa !222
  %incdec.ptr1 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !218
  store i8 %8, i8* %dest.05, align 1, !dbg !218, !tbaa !222
  %cmp = icmp eq i64 %dec, 0, !dbg !217
  br i1 %cmp, label %while.end, label %while.body, !dbg !217, !llvm.loop !223

while.end:                                        ; preds = %while.body, %middle.block, %entry
  ret i8* %destaddr, !dbg !224
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #3 {
entry:
  %cmp = icmp eq i8* %src, %dst, !dbg !225
  br i1 %cmp, label %return, label %if.end, !dbg !225

if.end:                                           ; preds = %entry
  %cmp1 = icmp ugt i8* %src, %dst, !dbg !227
  br i1 %cmp1, label %while.cond.preheader, label %if.else, !dbg !227

while.cond.preheader:                             ; preds = %if.end
  %tobool27 = icmp eq i64 %count, 0, !dbg !229
  br i1 %tobool27, label %return, label %while.body.preheader, !dbg !229

while.body.preheader:                             ; preds = %while.cond.preheader
  %n.vec = and i64 %count, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %0 = add i64 %count, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %while.body.preheader
  %scevgep37 = getelementptr i8* %src, i64 %0
  %scevgep = getelementptr i8* %dst, i64 %0
  %bound1 = icmp uge i8* %scevgep, %src
  %bound0 = icmp uge i8* %scevgep37, %dst
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %src, i64 %n.vec
  %ptr.ind.end39 = getelementptr i8* %dst, i64 %n.vec
  %rev.ind.end = sub i64 %count, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %src, i64 %index
  %next.gep136 = getelementptr i8* %dst, i64 %index
  %1 = bitcast i8* %next.gep to <16 x i8>*, !dbg !229
  %wide.load = load <16 x i8>* %1, align 1, !dbg !229
  %next.gep.sum610 = or i64 %index, 16, !dbg !229
  %2 = getelementptr i8* %src, i64 %next.gep.sum610, !dbg !229
  %3 = bitcast i8* %2 to <16 x i8>*, !dbg !229
  %wide.load233 = load <16 x i8>* %3, align 1, !dbg !229
  %4 = bitcast i8* %next.gep136 to <16 x i8>*, !dbg !229
  store <16 x i8> %wide.load, <16 x i8>* %4, align 1, !dbg !229
  %next.gep136.sum627 = or i64 %index, 16, !dbg !229
  %5 = getelementptr i8* %dst, i64 %next.gep136.sum627, !dbg !229
  %6 = bitcast i8* %5 to <16 x i8>*, !dbg !229
  store <16 x i8> %wide.load233, <16 x i8>* %6, align 1, !dbg !229
  %index.next = add i64 %index, 32
  %7 = icmp eq i64 %index.next, %n.vec
  br i1 %7, label %middle.block, label %vector.body, !llvm.loop !231

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %while.body.preheader
  %resume.val = phi i8* [ %src, %while.body.preheader ], [ %src, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val38 = phi i8* [ %dst, %while.body.preheader ], [ %dst, %vector.memcheck ], [ %ptr.ind.end39, %vector.body ]
  %resume.val40 = phi i64 [ %count, %while.body.preheader ], [ %count, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %while.body.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %count
  br i1 %cmp.n, label %return, label %while.body

while.body:                                       ; preds = %while.body, %middle.block
  %b.030 = phi i8* [ %incdec.ptr, %while.body ], [ %resume.val, %middle.block ]
  %a.029 = phi i8* [ %incdec.ptr3, %while.body ], [ %resume.val38, %middle.block ]
  %count.addr.028 = phi i64 [ %dec, %while.body ], [ %resume.val40, %middle.block ]
  %dec = add i64 %count.addr.028, -1, !dbg !229
  %incdec.ptr = getelementptr inbounds i8* %b.030, i64 1, !dbg !229
  %8 = load i8* %b.030, align 1, !dbg !229, !tbaa !222
  %incdec.ptr3 = getelementptr inbounds i8* %a.029, i64 1, !dbg !229
  store i8 %8, i8* %a.029, align 1, !dbg !229, !tbaa !222
  %tobool = icmp eq i64 %dec, 0, !dbg !229
  br i1 %tobool, label %return, label %while.body, !dbg !229, !llvm.loop !232

if.else:                                          ; preds = %if.end
  %sub = add i64 %count, -1, !dbg !233
  %tobool832 = icmp eq i64 %count, 0, !dbg !235
  br i1 %tobool832, label %return, label %while.body9.lr.ph, !dbg !235

while.body9.lr.ph:                                ; preds = %if.else
  %add.ptr5 = getelementptr inbounds i8* %src, i64 %sub, !dbg !236
  %add.ptr = getelementptr inbounds i8* %dst, i64 %sub, !dbg !233
  %n.vec241 = and i64 %count, -32
  %cmp.zero243 = icmp eq i64 %n.vec241, 0
  %9 = add i64 %count, -1
  br i1 %cmp.zero243, label %middle.block236, label %vector.memcheck250

vector.memcheck250:                               ; preds = %while.body9.lr.ph
  %scevgep245 = getelementptr i8* %src, i64 %9
  %scevgep244 = getelementptr i8* %dst, i64 %9
  %bound1247 = icmp ule i8* %scevgep245, %dst
  %bound0246 = icmp ule i8* %scevgep244, %src
  %memcheck.conflict249 = and i1 %bound0246, %bound1247
  %add.ptr5.sum = sub i64 %sub, %n.vec241
  %rev.ptr.ind.end = getelementptr i8* %src, i64 %add.ptr5.sum
  %add.ptr.sum = sub i64 %sub, %n.vec241
  %rev.ptr.ind.end255 = getelementptr i8* %dst, i64 %add.ptr.sum
  %rev.ind.end257 = sub i64 %count, %n.vec241
  br i1 %memcheck.conflict249, label %middle.block236, label %vector.body235

vector.body235:                                   ; preds = %vector.body235, %vector.memcheck250
  %index238 = phi i64 [ %index.next260, %vector.body235 ], [ 0, %vector.memcheck250 ]
  %add.ptr5.sum465 = sub i64 %sub, %index238
  %add.ptr.sum497 = sub i64 %sub, %index238
  %next.gep262.sum = add i64 %add.ptr5.sum465, -15, !dbg !235
  %10 = getelementptr i8* %src, i64 %next.gep262.sum, !dbg !235
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !235
  %wide.load460 = load <16 x i8>* %11, align 1, !dbg !235
  %reverse = shufflevector <16 x i8> %wide.load460, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !235
  %.sum = add i64 %add.ptr5.sum465, -31, !dbg !235
  %12 = getelementptr i8* %src, i64 %.sum, !dbg !235
  %13 = bitcast i8* %12 to <16 x i8>*, !dbg !235
  %wide.load461 = load <16 x i8>* %13, align 1, !dbg !235
  %reverse462 = shufflevector <16 x i8> %wide.load461, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !235
  %reverse463 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !235
  %next.gep359.sum = add i64 %add.ptr.sum497, -15, !dbg !235
  %14 = getelementptr i8* %dst, i64 %next.gep359.sum, !dbg !235
  %15 = bitcast i8* %14 to <16 x i8>*, !dbg !235
  store <16 x i8> %reverse463, <16 x i8>* %15, align 1, !dbg !235
  %reverse464 = shufflevector <16 x i8> %reverse462, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !235
  %.sum531 = add i64 %add.ptr.sum497, -31, !dbg !235
  %16 = getelementptr i8* %dst, i64 %.sum531, !dbg !235
  %17 = bitcast i8* %16 to <16 x i8>*, !dbg !235
  store <16 x i8> %reverse464, <16 x i8>* %17, align 1, !dbg !235
  %index.next260 = add i64 %index238, 32
  %18 = icmp eq i64 %index.next260, %n.vec241
  br i1 %18, label %middle.block236, label %vector.body235, !llvm.loop !237

middle.block236:                                  ; preds = %vector.body235, %vector.memcheck250, %while.body9.lr.ph
  %resume.val251 = phi i8* [ %add.ptr5, %while.body9.lr.ph ], [ %add.ptr5, %vector.memcheck250 ], [ %rev.ptr.ind.end, %vector.body235 ]
  %resume.val253 = phi i8* [ %add.ptr, %while.body9.lr.ph ], [ %add.ptr, %vector.memcheck250 ], [ %rev.ptr.ind.end255, %vector.body235 ]
  %resume.val256 = phi i64 [ %count, %while.body9.lr.ph ], [ %count, %vector.memcheck250 ], [ %rev.ind.end257, %vector.body235 ]
  %new.indc.resume.val258 = phi i64 [ 0, %while.body9.lr.ph ], [ 0, %vector.memcheck250 ], [ %n.vec241, %vector.body235 ]
  %cmp.n259 = icmp eq i64 %new.indc.resume.val258, %count
  br i1 %cmp.n259, label %return, label %while.body9

while.body9:                                      ; preds = %while.body9, %middle.block236
  %b.135 = phi i8* [ %incdec.ptr10, %while.body9 ], [ %resume.val251, %middle.block236 ]
  %a.134 = phi i8* [ %incdec.ptr11, %while.body9 ], [ %resume.val253, %middle.block236 ]
  %count.addr.133 = phi i64 [ %dec7, %while.body9 ], [ %resume.val256, %middle.block236 ]
  %dec7 = add i64 %count.addr.133, -1, !dbg !235
  %incdec.ptr10 = getelementptr inbounds i8* %b.135, i64 -1, !dbg !235
  %19 = load i8* %b.135, align 1, !dbg !235, !tbaa !222
  %incdec.ptr11 = getelementptr inbounds i8* %a.134, i64 -1, !dbg !235
  store i8 %19, i8* %a.134, align 1, !dbg !235, !tbaa !222
  %tobool8 = icmp eq i64 %dec7, 0, !dbg !235
  br i1 %tobool8, label %return, label %while.body9, !dbg !235, !llvm.loop !238

return:                                           ; preds = %while.body9, %middle.block236, %if.else, %while.body, %middle.block, %while.cond.preheader, %entry
  ret i8* %dst, !dbg !239
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #3 {
entry:
  %cmp3 = icmp eq i64 %len, 0, !dbg !240
  br i1 %cmp3, label %while.end, label %while.body.preheader, !dbg !240

while.body.preheader:                             ; preds = %entry
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %0 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %while.body.preheader
  %scevgep8 = getelementptr i8* %srcaddr, i64 %0
  %scevgep7 = getelementptr i8* %destaddr, i64 %0
  %bound1 = icmp uge i8* %scevgep7, %srcaddr
  %bound0 = icmp uge i8* %scevgep8, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end10 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep107 = getelementptr i8* %destaddr, i64 %index
  %1 = bitcast i8* %next.gep to <16 x i8>*, !dbg !241
  %wide.load = load <16 x i8>* %1, align 1, !dbg !241
  %next.gep.sum283 = or i64 %index, 16, !dbg !241
  %2 = getelementptr i8* %srcaddr, i64 %next.gep.sum283, !dbg !241
  %3 = bitcast i8* %2 to <16 x i8>*, !dbg !241
  %wide.load204 = load <16 x i8>* %3, align 1, !dbg !241
  %4 = bitcast i8* %next.gep107 to <16 x i8>*, !dbg !241
  store <16 x i8> %wide.load, <16 x i8>* %4, align 1, !dbg !241
  %next.gep107.sum300 = or i64 %index, 16, !dbg !241
  %5 = getelementptr i8* %destaddr, i64 %next.gep107.sum300, !dbg !241
  %6 = bitcast i8* %5 to <16 x i8>*, !dbg !241
  store <16 x i8> %wide.load204, <16 x i8>* %6, align 1, !dbg !241
  %index.next = add i64 %index, 32
  %7 = icmp eq i64 %index.next, %n.vec
  br i1 %7, label %middle.block, label %vector.body, !llvm.loop !242

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %while.body.preheader
  %resume.val = phi i8* [ %srcaddr, %while.body.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val9 = phi i8* [ %destaddr, %while.body.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end10, %vector.body ]
  %resume.val11 = phi i64 [ %len, %while.body.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %while.body.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %while.cond.while.end_crit_edge, label %while.body

while.body:                                       ; preds = %while.body, %middle.block
  %src.06 = phi i8* [ %incdec.ptr, %while.body ], [ %resume.val, %middle.block ]
  %dest.05 = phi i8* [ %incdec.ptr1, %while.body ], [ %resume.val9, %middle.block ]
  %len.addr.04 = phi i64 [ %dec, %while.body ], [ %resume.val11, %middle.block ]
  %dec = add i64 %len.addr.04, -1, !dbg !240
  %incdec.ptr = getelementptr inbounds i8* %src.06, i64 1, !dbg !241
  %8 = load i8* %src.06, align 1, !dbg !241, !tbaa !222
  %incdec.ptr1 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !241
  store i8 %8, i8* %dest.05, align 1, !dbg !241, !tbaa !222
  %cmp = icmp eq i64 %dec, 0, !dbg !240
  br i1 %cmp, label %while.cond.while.end_crit_edge, label %while.body, !dbg !240, !llvm.loop !243

while.cond.while.end_crit_edge:                   ; preds = %while.body, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %while.end, !dbg !240

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %dest.0.lcssa = phi i8* [ %scevgep, %while.cond.while.end_crit_edge ], [ %destaddr, %entry ]
  ret i8* %dest.0.lcssa, !dbg !244
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #3 {
entry:
  %cmp2 = icmp eq i64 %count, 0, !dbg !245
  br i1 %cmp2, label %while.end, label %while.body.lr.ph, !dbg !245

while.body.lr.ph:                                 ; preds = %entry
  %conv = trunc i32 %s to i8, !dbg !246
  br label %while.body, !dbg !245

while.body:                                       ; preds = %while.body, %while.body.lr.ph
  %a.04 = phi i8* [ %dst, %while.body.lr.ph ], [ %incdec.ptr, %while.body ]
  %count.addr.03 = phi i64 [ %count, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add i64 %count.addr.03, -1, !dbg !245
  %incdec.ptr = getelementptr inbounds i8* %a.04, i64 1, !dbg !246
  store volatile i8 %conv, i8* %a.04, align 1, !dbg !246, !tbaa !222
  %cmp = icmp eq i64 %dec, 0, !dbg !245
  br i1 %cmp, label %while.end, label %while.body, !dbg !245

while.end:                                        ; preds = %while.body, %entry
  ret i8* %dst, !dbg !247
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nobuiltin nounwind }
attributes #7 = { nobuiltin noreturn nounwind }

!llvm.dbg.cu = !{!0, !12, !24, !34, !47, !58, !70, !88, !102, !116}
!llvm.module.flags = !{!131, !132}
!llvm.ident = !{!133, !133, !133, !133, !133, !133, !133, !133, !133, !133}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.4 (tags/RELEASE_34/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/shelly/klee/examples/triang/triangle.c] [DW_LANG_C99]
!1 = metadata !{metadata !"triangle.c", metadata !"/home/shelly/klee/examples/triang"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"triang", metadata !"triang", metadata !"", i32 4, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32, i32)* @triang, null, null, metadata !2, i32 5} ; [ DW_TAG_subprogram ] [line 4] [def] [scope 5] [triang]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/shelly/klee/examples/triang/triangle.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 57, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 57} ; [ DW_TAG_subprogram ] [line 57] [def] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786449, metadata !13, i32 1, metadata !"clang version 3.4 (tags/RELEASE_34/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !14, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_choose.c] [DW_LANG_C89]
!13 = metadata !{metadata !"/home/shelly/klee/runtime/Intrinsic/klee_choose.c", metadata !"/home/shelly/klee_build/runtime/Intrinsic"}
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786478, metadata !13, metadata !16, metadata !"klee_choose", metadata !"klee_choose", metadata !"", i32 12, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i64)* @klee_choose, null, null, metadata !21, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [klee_choose]
!16 = metadata !{i32 786473, metadata !13}        ; [ DW_TAG_file_type ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_choose.c]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !19, metadata !19}
!19 = metadata !{i32 786454, metadata !13, null, metadata !"uintptr_t", i32 122, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [uintptr_t] [line 122, size 0, align 0, offset 0] [from long unsigned int]
!20 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!21 = metadata !{metadata !22, metadata !23}
!22 = metadata !{i32 786689, metadata !15, metadata !"n", metadata !16, i32 16777228, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 12]
!23 = metadata !{i32 786688, metadata !15, metadata !"x", metadata !16, i32 13, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 13]
!24 = metadata !{i32 786449, metadata !25, i32 1, metadata !"clang version 3.4 (tags/RELEASE_34/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !26, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_div_zero_check.c] [DW_LANG_C89]
!25 = metadata !{metadata !"/home/shelly/klee/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/shelly/klee_build/runtime/Intrinsic"}
!26 = metadata !{metadata !27}
!27 = metadata !{i32 786478, metadata !25, metadata !28, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, null, null, metadata !32, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [klee_div_zero_check]
!28 = metadata !{i32 786473, metadata !25}        ; [ DW_TAG_file_type ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_div_zero_check.c]
!29 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{null, metadata !31}
!31 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!32 = metadata !{metadata !33}
!33 = metadata !{i32 786689, metadata !27, metadata !"z", metadata !28, i32 16777228, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!34 = metadata !{i32 786449, metadata !35, i32 1, metadata !"clang version 3.4 (tags/RELEASE_34/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !36, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_int.c] [DW_LANG_C89]
!35 = metadata !{metadata !"/home/shelly/klee/runtime/Intrinsic/klee_int.c", metadata !"/home/shelly/klee_build/runtime/Intrinsic"}
!36 = metadata !{metadata !37}
!37 = metadata !{i32 786478, metadata !35, metadata !38, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !39, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !44, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [klee_int]
!38 = metadata !{i32 786473, metadata !35}        ; [ DW_TAG_file_type ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_int.c]
!39 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !40, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = metadata !{metadata !8, metadata !41}
!41 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !42} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!42 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!43 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!44 = metadata !{metadata !45, metadata !46}
!45 = metadata !{i32 786689, metadata !37, metadata !"name", metadata !38, i32 16777229, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!46 = metadata !{i32 786688, metadata !37, metadata !"x", metadata !38, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!47 = metadata !{i32 786449, metadata !48, i32 1, metadata !"clang version 3.4 (tags/RELEASE_34/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !49, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_overshift_check.c] [DW_LANG_C89]
!48 = metadata !{metadata !"/home/shelly/klee/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/shelly/klee_build/runtime/Intrinsic"}
!49 = metadata !{metadata !50}
!50 = metadata !{i32 786478, metadata !48, metadata !51, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !52, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_check, null, null, metadata !55, i32 20} ; [ DW_TAG_subprogram ] [line 20] [def] [klee_overshift_check]
!51 = metadata !{i32 786473, metadata !48}        ; [ DW_TAG_file_type ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_overshift_check.c]
!52 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !53, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!53 = metadata !{null, metadata !54, metadata !54}
!54 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!55 = metadata !{metadata !56, metadata !57}
!56 = metadata !{i32 786689, metadata !50, metadata !"bitWidth", metadata !51, i32 16777236, metadata !54, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!57 = metadata !{i32 786689, metadata !50, metadata !"shift", metadata !51, i32 33554452, metadata !54, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!58 = metadata !{i32 786449, metadata !59, i32 1, metadata !"clang version 3.4 (tags/RELEASE_34/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !60, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_range.c] [DW_LANG_C89]
!59 = metadata !{metadata !"/home/shelly/klee/runtime/Intrinsic/klee_range.c", metadata !"/home/shelly/klee_build/runtime/Intrinsic"}
!60 = metadata !{metadata !61}
!61 = metadata !{i32 786478, metadata !59, metadata !62, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !63, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !65, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [klee_range]
!62 = metadata !{i32 786473, metadata !59}        ; [ DW_TAG_file_type ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_range.c]
!63 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !64, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = metadata !{metadata !8, metadata !8, metadata !8, metadata !41}
!65 = metadata !{metadata !66, metadata !67, metadata !68, metadata !69}
!66 = metadata !{i32 786689, metadata !61, metadata !"start", metadata !62, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!67 = metadata !{i32 786689, metadata !61, metadata !"end", metadata !62, i32 33554445, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!68 = metadata !{i32 786689, metadata !61, metadata !"name", metadata !62, i32 50331661, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!69 = metadata !{i32 786688, metadata !61, metadata !"x", metadata !62, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!70 = metadata !{i32 786449, metadata !71, i32 1, metadata !"clang version 3.4 (tags/RELEASE_34/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !72, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/memcpy.c] [DW_LANG_C89]
!71 = metadata !{metadata !"/home/shelly/klee/runtime/Intrinsic/memcpy.c", metadata !"/home/shelly/klee_build/runtime/Intrinsic"}
!72 = metadata !{metadata !73}
!73 = metadata !{i32 786478, metadata !71, metadata !74, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !75, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !81, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [memcpy]
!74 = metadata !{i32 786473, metadata !71}        ; [ DW_TAG_file_type ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/memcpy.c]
!75 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !76, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!76 = metadata !{metadata !77, metadata !77, metadata !78, metadata !80}
!77 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!78 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !79} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!79 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!80 = metadata !{i32 786454, metadata !71, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!81 = metadata !{metadata !82, metadata !83, metadata !84, metadata !85, metadata !87}
!82 = metadata !{i32 786689, metadata !73, metadata !"destaddr", metadata !74, i32 16777228, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!83 = metadata !{i32 786689, metadata !73, metadata !"srcaddr", metadata !74, i32 33554444, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!84 = metadata !{i32 786689, metadata !73, metadata !"len", metadata !74, i32 50331660, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!85 = metadata !{i32 786688, metadata !73, metadata !"dest", metadata !74, i32 13, metadata !86, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!86 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !43} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!87 = metadata !{i32 786688, metadata !73, metadata !"src", metadata !74, i32 14, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!88 = metadata !{i32 786449, metadata !89, i32 1, metadata !"clang version 3.4 (tags/RELEASE_34/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !90, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/memmove.c] [DW_LANG_C89]
!89 = metadata !{metadata !"/home/shelly/klee/runtime/Intrinsic/memmove.c", metadata !"/home/shelly/klee_build/runtime/Intrinsic"}
!90 = metadata !{metadata !91}
!91 = metadata !{i32 786478, metadata !89, metadata !92, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !93, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !96, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [memmove]
!92 = metadata !{i32 786473, metadata !89}        ; [ DW_TAG_file_type ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/memmove.c]
!93 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !94, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!94 = metadata !{metadata !77, metadata !77, metadata !78, metadata !95}
!95 = metadata !{i32 786454, metadata !89, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!96 = metadata !{metadata !97, metadata !98, metadata !99, metadata !100, metadata !101}
!97 = metadata !{i32 786689, metadata !91, metadata !"dst", metadata !92, i32 16777228, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!98 = metadata !{i32 786689, metadata !91, metadata !"src", metadata !92, i32 33554444, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!99 = metadata !{i32 786689, metadata !91, metadata !"count", metadata !92, i32 50331660, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!100 = metadata !{i32 786688, metadata !91, metadata !"a", metadata !92, i32 13, metadata !86, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!101 = metadata !{i32 786688, metadata !91, metadata !"b", metadata !92, i32 14, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!102 = metadata !{i32 786449, metadata !103, i32 1, metadata !"clang version 3.4 (tags/RELEASE_34/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !104, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/mempcpy.c] [DW_LANG_C89]
!103 = metadata !{metadata !"/home/shelly/klee/runtime/Intrinsic/mempcpy.c", metadata !"/home/shelly/klee_build/runtime/Intrinsic"}
!104 = metadata !{metadata !105}
!105 = metadata !{i32 786478, metadata !103, metadata !106, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !107, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !110, i32 11} ; [ DW_TAG_subprogram ] [line 11] [def] [mempcpy]
!106 = metadata !{i32 786473, metadata !103}      ; [ DW_TAG_file_type ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/mempcpy.c]
!107 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!108 = metadata !{metadata !77, metadata !77, metadata !78, metadata !109}
!109 = metadata !{i32 786454, metadata !103, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!110 = metadata !{metadata !111, metadata !112, metadata !113, metadata !114, metadata !115}
!111 = metadata !{i32 786689, metadata !105, metadata !"destaddr", metadata !106, i32 16777227, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!112 = metadata !{i32 786689, metadata !105, metadata !"srcaddr", metadata !106, i32 33554443, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!113 = metadata !{i32 786689, metadata !105, metadata !"len", metadata !106, i32 50331659, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!114 = metadata !{i32 786688, metadata !105, metadata !"dest", metadata !106, i32 12, metadata !86, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!115 = metadata !{i32 786688, metadata !105, metadata !"src", metadata !106, i32 13, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!116 = metadata !{i32 786449, metadata !117, i32 1, metadata !"clang version 3.4 (tags/RELEASE_34/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !118, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/memset.c] [DW_LANG_C89]
!117 = metadata !{metadata !"/home/shelly/klee/runtime/Intrinsic/memset.c", metadata !"/home/shelly/klee_build/runtime/Intrinsic"}
!118 = metadata !{metadata !119}
!119 = metadata !{i32 786478, metadata !117, metadata !120, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !121, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !124, i32 11} ; [ DW_TAG_subprogram ] [line 11] [def] [memset]
!120 = metadata !{i32 786473, metadata !117}      ; [ DW_TAG_file_type ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/memset.c]
!121 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !122, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!122 = metadata !{metadata !77, metadata !77, metadata !8, metadata !123}
!123 = metadata !{i32 786454, metadata !117, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!124 = metadata !{metadata !125, metadata !126, metadata !127, metadata !128}
!125 = metadata !{i32 786689, metadata !119, metadata !"dst", metadata !120, i32 16777227, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!126 = metadata !{i32 786689, metadata !119, metadata !"s", metadata !120, i32 33554443, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!127 = metadata !{i32 786689, metadata !119, metadata !"count", metadata !120, i32 50331659, metadata !123, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!128 = metadata !{i32 786688, metadata !119, metadata !"a", metadata !120, i32 12, metadata !129, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!129 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !130} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!130 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!131 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!132 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!133 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
!134 = metadata !{i32 16, i32 0, metadata !135, null}
!135 = metadata !{i32 786443, metadata !1, metadata !4, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/triangle.c]
!136 = metadata !{i32 18, i32 0, metadata !137, null}
!137 = metadata !{i32 786443, metadata !1, metadata !135, i32 17, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/triangle.c]
!138 = metadata !{i32 19, i32 0, metadata !137, null}
!139 = metadata !{i32 22, i32 0, metadata !4, null}
!140 = metadata !{i32 23, i32 0, metadata !141, null}
!141 = metadata !{i32 786443, metadata !1, metadata !4, i32 23, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/triangle.c]
!142 = metadata !{i32 24, i32 0, metadata !141, null}
!143 = metadata !{i32 25, i32 0, metadata !144, null}
!144 = metadata !{i32 786443, metadata !1, metadata !4, i32 25, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/triangle.c]
!145 = metadata !{i32 26, i32 0, metadata !144, null}
!146 = metadata !{i32 27, i32 0, metadata !147, null}
!147 = metadata !{i32 786443, metadata !1, metadata !4, i32 27, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/triangle.c]
!148 = metadata !{i32 28, i32 0, metadata !147, null}
!149 = metadata !{i32 29, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !1, metadata !4, i32 29, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/triangle.c]
!151 = metadata !{i32 33, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !1, metadata !153, i32 33, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/triangle.c]
!153 = metadata !{i32 786443, metadata !1, metadata !150, i32 30, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/triangle.c]
!154 = metadata !{i32 35, i32 0, metadata !152, null}
!155 = metadata !{i32 37, i32 0, metadata !152, null}
!156 = metadata !{i32 38, i32 0, metadata !153, null}
!157 = metadata !{i32 44, i32 0, metadata !158, null}
!158 = metadata !{i32 786443, metadata !1, metadata !4, i32 44, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/triangle.c]
!159 = metadata !{i32 45, i32 0, metadata !158, null}
!160 = metadata !{i32 46, i32 0, metadata !161, null}
!161 = metadata !{i32 786443, metadata !1, metadata !158, i32 46, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/triangle.c]
!162 = metadata !{i32 47, i32 0, metadata !161, null}
!163 = metadata !{i32 48, i32 0, metadata !164, null}
!164 = metadata !{i32 786443, metadata !1, metadata !161, i32 48, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/triangle.c]
!165 = metadata !{i32 49, i32 0, metadata !164, null}
!166 = metadata !{i32 50, i32 0, metadata !167, null}
!167 = metadata !{i32 786443, metadata !1, metadata !164, i32 50, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/shelly/klee/examples/triang/triangle.c]
!168 = metadata !{i32 51, i32 0, metadata !167, null}
!169 = metadata !{i32 53, i32 0, metadata !167, null}
!170 = metadata !{i32 54, i32 0, metadata !4, null}
!171 = metadata !{i32 55, i32 0, metadata !4, null}
!172 = metadata !{i32 62, i32 0, metadata !9, null}
!173 = metadata !{i32 63, i32 0, metadata !9, null}
!174 = metadata !{i32 64, i32 0, metadata !9, null}
!175 = metadata !{i32 66, i32 0, metadata !9, null}
!176 = metadata !{i32 67, i32 0, metadata !9, null}
!177 = metadata !{i32 68, i32 0, metadata !9, null}
!178 = metadata !{i32 14, i32 0, metadata !15, null}
!179 = metadata !{i32 17, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !13, metadata !15, i32 17, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_choose.c]
!181 = metadata !{metadata !182, metadata !182, i64 0}
!182 = metadata !{metadata !"long", metadata !183, i64 0}
!183 = metadata !{metadata !"omnipotent char", metadata !184, i64 0}
!184 = metadata !{metadata !"Simple C/C++ TBAA"}
!185 = metadata !{i32 18, i32 0, metadata !180, null}
!186 = metadata !{i32 19, i32 0, metadata !15, null}
!187 = metadata !{i32 13, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !25, metadata !27, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_div_zero_check.c]
!189 = metadata !{i32 14, i32 0, metadata !188, null}
!190 = metadata !{i32 15, i32 0, metadata !27, null}
!191 = metadata !{i32 15, i32 0, metadata !37, null}
!192 = metadata !{i32 16, i32 0, metadata !37, null}
!193 = metadata !{metadata !194, metadata !194, i64 0}
!194 = metadata !{metadata !"int", metadata !183, i64 0}
!195 = metadata !{i32 21, i32 0, metadata !196, null}
!196 = metadata !{i32 786443, metadata !48, metadata !50, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_overshift_check.c]
!197 = metadata !{i32 27, i32 0, metadata !198, null}
!198 = metadata !{i32 786443, metadata !48, metadata !196, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_overshift_check.c]
!199 = metadata !{i32 29, i32 0, metadata !50, null}
!200 = metadata !{i32 16, i32 0, metadata !201, null}
!201 = metadata !{i32 786443, metadata !59, metadata !61, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_range.c]
!202 = metadata !{i32 17, i32 0, metadata !201, null}
!203 = metadata !{i32 19, i32 0, metadata !204, null}
!204 = metadata !{i32 786443, metadata !59, metadata !61, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_range.c]
!205 = metadata !{i32 22, i32 0, metadata !206, null}
!206 = metadata !{i32 786443, metadata !59, metadata !204, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_range.c]
!207 = metadata !{i32 25, i32 0, metadata !208, null}
!208 = metadata !{i32 786443, metadata !59, metadata !206, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_range.c]
!209 = metadata !{i32 26, i32 0, metadata !210, null}
!210 = metadata !{i32 786443, metadata !59, metadata !208, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_range.c]
!211 = metadata !{i32 27, i32 0, metadata !210, null}
!212 = metadata !{i32 28, i32 0, metadata !213, null}
!213 = metadata !{i32 786443, metadata !59, metadata !208, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/klee_range.c]
!214 = metadata !{i32 29, i32 0, metadata !213, null}
!215 = metadata !{i32 32, i32 0, metadata !206, null}
!216 = metadata !{i32 34, i32 0, metadata !61, null}
!217 = metadata !{i32 16, i32 0, metadata !73, null}
!218 = metadata !{i32 17, i32 0, metadata !73, null}
!219 = metadata !{metadata !219, metadata !220, metadata !221}
!220 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!221 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!222 = metadata !{metadata !183, metadata !183, i64 0}
!223 = metadata !{metadata !223, metadata !220, metadata !221}
!224 = metadata !{i32 18, i32 0, metadata !73, null}
!225 = metadata !{i32 16, i32 0, metadata !226, null}
!226 = metadata !{i32 786443, metadata !89, metadata !91, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/memmove.c]
!227 = metadata !{i32 19, i32 0, metadata !228, null}
!228 = metadata !{i32 786443, metadata !89, metadata !91, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/memmove.c]
!229 = metadata !{i32 20, i32 0, metadata !230, null}
!230 = metadata !{i32 786443, metadata !89, metadata !228, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/memmove.c]
!231 = metadata !{metadata !231, metadata !220, metadata !221}
!232 = metadata !{metadata !232, metadata !220, metadata !221}
!233 = metadata !{i32 22, i32 0, metadata !234, null}
!234 = metadata !{i32 786443, metadata !89, metadata !228, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/shelly/klee_build/runtime/Intrinsic//home/shelly/klee/runtime/Intrinsic/memmove.c]
!235 = metadata !{i32 24, i32 0, metadata !234, null}
!236 = metadata !{i32 23, i32 0, metadata !234, null}
!237 = metadata !{metadata !237, metadata !220, metadata !221}
!238 = metadata !{metadata !238, metadata !220, metadata !221}
!239 = metadata !{i32 28, i32 0, metadata !91, null}
!240 = metadata !{i32 15, i32 0, metadata !105, null}
!241 = metadata !{i32 16, i32 0, metadata !105, null}
!242 = metadata !{metadata !242, metadata !220, metadata !221}
!243 = metadata !{metadata !243, metadata !220, metadata !221}
!244 = metadata !{i32 17, i32 0, metadata !105, null}
!245 = metadata !{i32 13, i32 0, metadata !119, null}
!246 = metadata !{i32 14, i32 0, metadata !119, null}
!247 = metadata !{i32 15, i32 0, metadata !119, null}
