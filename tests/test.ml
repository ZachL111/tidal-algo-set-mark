#use "src/core.ml";;

let expect condition = if not condition then failwith "fixture mismatch";;
let signal_case_1 = { demand = 76; capacity = 89; latency = 25; risk = 11; weight = 4 };;
expect (score signal_case_1 = 123);;
expect (classify signal_case_1 = "review");;
let signal_case_2 = { demand = 75; capacity = 105; latency = 17; risk = 11; weight = 11 };;
expect (score signal_case_2 = 182);;
expect (classify signal_case_2 = "accept");;
let signal_case_3 = { demand = 68; capacity = 87; latency = 12; risk = 22; weight = 4 };;
expect (score signal_case_3 = 89);;
expect (classify signal_case_3 = "review");;
