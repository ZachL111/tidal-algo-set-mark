type review_item = {
  signal : int;
  slack : int;
  drag : int;
  confidence : int;
}

let review_score item =
  item.signal * 2 + item.slack + item.confidence - item.drag * 3

let review_lane item =
  if review_score item >= 140 then "ship"
  else if review_score item >= 105 then "watch"
  else "hold"
