"  function! MyTabLabel(n)
" 	let buflist = tabpagebuflist(a:n)
" 	let winnr = tabpagewinnr(a:n)
" 	let tabline = bufname(buflist[winnr - 1])
"
" 	return tabline
" endfunction
"
" function! MyTabLine()
" 	let tabline = ''
" 	for i in range(tabpagenr('$'))
" 		" select the highlighting
" 		if i + 1 == tabpagenr()
" 			let tabline .= '%#TabLineSel#'
" 		else
" 			let tabline .= '%#TabLine#'
" 		endif
"
" 		" set the tab page number (for mouse clicks)
" 		let tabline .= '%' . (i + 1) . 'T'
"
" 		" the label is made by MyTabLabel()
" 		let tabline .= ' %{MyTabLabel(' . (i + 1) . ')} '
" 	endfor
"
" 	" after the last tab fill with TabLineFill and reset tab page nr
" 	let tabline .= '%#TabLineFill#%T'
"
" 	" right-align the label to close the current tab page
" 	if tabpagenr('$') > 1
" 		let tabline .= '%=%#TabLine#%999Xclose'
" 	endif
"
" 	return tabline
" endfunction
"
" hi TabLineSel guibg=#424242 guifg=#FFAF00
" hi TabLine guibg=#424242 guifg=#999999
" set tabline=%!MyTabLine()
set showtabline=2
