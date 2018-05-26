file(REMOVE_RECURSE
  "Intrinsics/Output"
  "Replay/Output"
  "Replay/libkleeruntest/Output"
  "Coverage/Output"
  "Programs/Output"
  "Concrete/Output"
  "regression/Output"
  "Expr/Output"
  "Expr/Parser/Output"
  "Expr/Lexer/Output"
  "Runtime/Output"
  "Runtime/POSIX/Output"
  "Runtime/POSIX/SELinux/Output"
  "Runtime/Uclibc/Output"
  "Feature/Output"
  "Merging/Output"
  "VectorInstructions/Output"
  "Solver/Output"
  "Dogfood/Output"
  "CXX/Output"
  "CMakeFiles/systemtests"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/systemtests.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
