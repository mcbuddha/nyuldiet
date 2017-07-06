NYUL = 'X'
window.nyultap = null
window.card = null
window.LS = 5

window.next = ->
  window.card = window.kk[_.random window.kk.length-1]
  window.ls()
  ($ 'input').removeClass 'ok wrong'
  ($ '#q').text window.card.q
  ($ '#num').text window.card.num
  ($ '#a + .opt').text window.card.a
  ($ '#b + .opt').text window.card.b
  ($ '#c + .opt').text window.card.c
  ($ '#d + .opt').text window.card.d

window.ls = ->
  ($ '#lives').html (new Array(1+window.LS)).join NYUL
  if window.LS < 1
    alert 'Game over, megbuktál :('
    window.location.reload()

window.ok = (a, b) ->
  ans = a.target.innerText.toLowerCase()
  if window.card.ans is ans
    window.next()
  else
    window.LS--
    window.ls()

$ ->
  ($ '#a, #b, #c, #d').click (a, b) -> window.ok a, b
  window.kk = _.collect window.konnyu, (i) ->
    [num, ans, q, a, b, c, d] = i
    num: num
    ans: ans
    q: q
    a: a
    b: b
    c: c
    d: d
  window.nn = _.collect window.nehez, (i) ->
    [num, ans, q, a, b, c, d] = i
    num: num
    ans: ans
    q: q
    a: a
    b: b
    c: c
    d: d
  window.next()
