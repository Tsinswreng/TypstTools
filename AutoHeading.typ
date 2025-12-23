//TODO 層級不深 廣度深(同級者多)旹時有警告: layout did not converge within 5 attempts Hint: check if any states or queries are updating themselvestypst
// 用來記「目前層級」
#let lvl = counter("heading-lvl")

// 用來記「每一層的序號」
#let cnt(level) = counter("heading-" + str(level))

// 把「1.2.3」這種 prefix 拼出來
#let prefix(level) = {
	if level <= 1 { return "" }
	//(1..level).map(i => cnt(i).display()).join(".") + "."
}

// 真正下標題的函數
#let H(Title, Content) = context {
	// 先讓層級 +1
	lvl.step()
	let l = lvl.get().first()

	// 這一層的序號 +1
	cnt(l).step()

	// 把 prefix 跟本層序號合起來
	let num = prefix(l) + cnt(l).display()

	// 用正規 heading 輸出，自帶書籤、目錄、編號
	heading(
		level: l+1,
		//numbering: num,
		//body
	)[#Title]
	Content
	// 把「層級」傳給子層，子層結束後再退回來
	//body
	lvl.update(l)
}

/*
#set heading(numbering: "1.")


#H("一")[
	內容一
	#H("二")[
		內容二
		#H("三")[
			內容三
			#H("四")[
				內容四
				#H("五")[
					內容五
					#H("六")[
						內容六
						#H("七")[
							內容七
						]
					]
				]
			]
		]
	]
]
 */

#if false{
[
#let lvl = counter("heading-lvl")
// 真正下標題的函數
#let H(Title, Content) = context {
	// 先讓當前層級 +1
	lvl.step()//lvl++
	//當前層級數字
	let l = lvl.get().first()

	[#text(red)[#(l+1)]]//t
	heading(
		level: l+1,
		//body
	)[#Title]
	Content//子層
	// 子層結束後重置層級
	lvl.update(l)//lvl=l
}
]
}
