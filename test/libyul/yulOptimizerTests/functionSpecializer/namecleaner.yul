{
	// This function name can be shortened, the other cannot.
	function nonmstore_(x) {
		nonmstore_(x)
		sstore(10, calldataload(2))
	}
	function mstore_(x) -> y {
		let t3_3_ := mstore_(x)
		y := 8
		sstore(y, calldataload(y))
	}
	let t2_ := mstore_(7)
	nonmstore_(70)
}
// ----
// step: functionSpecializer
//
// {
//     let t2_ := mstore__1()
//     nonmstore__2()
//     function nonmstore__2()
//     {
//         let x_3 := 70
//         nonmstore_(x_3)
//         sstore(10, calldataload(2))
//     }
//     function nonmstore_(x)
//     {
//         nonmstore_(x)
//         sstore(10, calldataload(2))
//     }
//     function mstore__1() -> y_4
//     {
//         let x_1_5 := 7
//         let t3_3__6 := mstore_(x_1_5)
//         y_4 := 8
//         sstore(y_4, calldataload(y_4))
//     }
//     function mstore_(x_1) -> y
//     {
//         let t3_3_ := mstore_(x_1)
//         y := 8
//         sstore(y, calldataload(y))
//     }
// }
