NYUL = '&#128048;'
window.nyultap = null
window.card = null
window.LS = 5

window.next = ->
  if window.LS < 1
    alert 'Game over, megbuktál :('
    window.location.reload()
  window.card = window.nyultap[_.random window.nyultap.length-1]
  ($ '#lives').html (new Array(1+window.LS)).join NYUL
  ($ '.hi').remove()
  ($ 'input').removeClass 'ok wrong'
  ($ '[type=number]').val 0
  ($ '#name').text window.card.name
  for k in 'energy protein fat ch'.split ' '
    if window.card[k].length > 1
      ($ "##{k[0]}").append "<td class=\"hi\"><input type=\"button\" value=\"HINT\" onclick=\"hint('#{k}')\"></td>"
    else
      ($ "##{k[0]}").append "<td class=\"hi\"></td>"

window.ok = -> window.next() if _.reduce ($ '[type=number]'), ((a,f) ->
  f = $ f
  if window.card[(f.attr 'name')][0] isnt f.val()
    (f.removeClass 'ok').addClass 'wrong'
    no
  else
    (f.removeClass 'wrong').addClass 'ok'
    a), on

window.show = -> ($ "[name=#{k}]").val window.card[k][0] for k in 'energy protein fat ch'.split ' '
window.hint = (k) -> alert window.card[k][1]

$ ->
  ($ 'input[type=number]').on 'focus', (e) -> ($ e.target).val ''
  window.nyultap = _.map (window.tap.split '\n'), (i) ->
    line = _.map (i.split ','), (j) -> j.trim()
    field = (f) -> (f.replace ']', '').split '['
    name: line[0][..(x=(line[0].split '[')[0].lastIndexOf ' ')].trim()
    energy: field line[0][x..].trim()
    protein: field line[1]
    fat: field line[2]
    ch: field line[3]
  window.next()
