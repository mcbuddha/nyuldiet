// Generated by CoffeeScript 1.12.0
var NYUL;

NYUL = 'X';

window.nyultap = null;

window.card = null;

window.LS = 5;

window.next = function() {
  window.card = window.kk[_.random(window.kk.length - 1)];
  window.ls();
  ($('input')).removeClass('ok wrong');
  ($('#q')).text(window.card.q);
  ($('#num')).text(window.card.num);
  ($('#a + .opt')).text(window.card.a);
  ($('#b + .opt')).text(window.card.b);
  ($('#c + .opt')).text(window.card.c);
  return ($('#d + .opt')).text(window.card.d);
};

window.ls = function() {
  ($('#lives')).html((new Array(1 + window.LS)).join(NYUL));
  if (window.LS < 1) {
    alert('Game over, megbuktál :(');
    return window.location.reload();
  }
};

window.ok = function(a, b) {
  var ans;
  ans = a.target.innerText.toLowerCase();
  if (window.card.ans === ans) {
    return window.next();
  } else {
    window.LS--;
    return window.ls();
  }
};

$(function() {
  ($('#a, #b, #c, #d')).click(function(a, b) {
    return window.ok(a, b);
  });
  window.kk = _.collect(window.konnyu, function(i) {
    var a, ans, b, c, d, num, q;
    num = i[0], ans = i[1], q = i[2], a = i[3], b = i[4], c = i[5], d = i[6];
    return {
      num: num,
      ans: ans,
      q: q,
      a: a,
      b: b,
      c: c,
      d: d
    };
  });
  window.nn = _.collect(window.nehez, function(i) {
    var a, ans, b, c, d, num, q;
    num = i[0], ans = i[1], q = i[2], a = i[3], b = i[4], c = i[5], d = i[6];
    return {
      num: num,
      ans: ans,
      q: q,
      a: a,
      b: b,
      c: c,
      d: d
    };
  });
  return window.next();
});
