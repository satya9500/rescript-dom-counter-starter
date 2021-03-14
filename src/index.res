@val external document: {..} = "document"

let count = ref(0)

let renderCountTextView: int => unit = (n) => {
    let el = document["getElementById"]("count")
    el["innerText"] = `Count is ${Belt.Int.toString(n)}`
}

let updateCount:int => unit = steps => {
    count := steps + count.contents
}

let renderView: int => unit = steps => {
    updateCount(steps)
    let el = document["getElementById"]("count")
    if count.contents > 0 {
        el["className"] = "count count-positive"
    } else if count.contents < 0 {
        el["className"] = "count count-negative"
    } else {
        el["className"] = "count count-zero"
    }
    renderCountTextView(count.contents)
}

let plusOne: unit => unit = () => {
    renderView(1)
}

let minusOne: unit => unit = () => {
    renderView(-1)
}

let plusButton = document["getElementById"]("plus-one")
plusButton["addEventListener"]("click", plusOne)

let minusButton = document["getElementById"]("minus-one")
minusButton["addEventListener"]("click", minusOne)