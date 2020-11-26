{
    {
        let t := mstore_(7)
        nonmstore(70)
    }
    function nonmstore(x)
    {
        nonmstore(x)
        sstore(10, calldataload(2))
    }
    function mstore_(x_1) -> y
    {
        let t3_ := mstore_(x_1)
        y := 8
        sstore(y, calldataload(y))
    }
}
// ----
// step: functionSpecializer
//
// {
//     {
//         let t := mstore__1()
//         nonmstore_2()
//     }
//     function nonmstore_2()
//     {
//         let x_3 := 70
//         nonmstore(x_3)
//         sstore(10, calldataload(2))
//     }
//     function nonmstore(x)
//     {
//         nonmstore(x)
//         sstore(10, calldataload(2))
//     }
//     function mstore__1() -> y_4
//     {
//         let x_1_5 := 7
//         let t3__6 := mstore_(x_1_5)
//         y_4 := 8
//         sstore(y_4, calldataload(y_4))
//     }
//     function mstore_(x_1) -> y
//     {
//         let t3_ := mstore_(x_1)
//         y := 8
//         sstore(y, calldataload(y))
//     }
// }
