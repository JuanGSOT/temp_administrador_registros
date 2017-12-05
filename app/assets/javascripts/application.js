// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery3
//= require jquery_ujs
//= require highcharts/highcharts
//= require highcharts/highcharts-more
//= require highcharts/highstock

/* fechas - history*/
function another(val) {
  if (val === '0') {
    var menu = document.getElementsByClassName("menu");
    menu[1].style.display = "block";
    menu[0].style.display = "none";
  }
}

/* registry - new*/
function optionBlank(val) {
  console.log(val);
}

$(document).ready(function () {
  if ($(".alert").length === 1 || $(".notice").length === 1){
    setTimeout(function () {
      $(".notice, .alert").slideUp(3000).hide(4000);
    }, 3000);
  }

  if ($("#date_time").length === 0) {
    clearInterval(a);
  }
});

var a = setInterval(function() { 
  var d = new Date();
  var h = d.getHours();
  var hr = (h > 12 ? h - 12 : h);
  var mi = d.getMinutes();
  var s = d.getSeconds();
  var time =  (hr<10?" 0":" ") + hr + ":" + (mi<10?"0":"") + mi + ":" + (s<10?"0":"") + s + " " + (h > 11 ? "pm" : "am");
  var selector = document.getElementById("date_time");
  selector.innerHTML = time;
}, 1000);

function thisHour(){
  var t = new Date();
  var date_now = t.getDate() + "-" + (t.getMonth() + 1) + "-" + t.getFullYear()
  var time_now = t.getHours() + ":" + t.getMinutes() + ":" + t.getSeconds();
  var now = date_now + " " + time_now;
  console.log(now);
  $("#registry_loan").val(now);
}

function changeHref(){
  var a = $("#codig").val();
  var b = "/teachers/" + a;
  $("#trigger-du").attr("href", b);
}

function funA() {
  $("#del").css("display","none");
  $("#upd").css("display","block");
}
function funB(){
  $("#upd").css("display","none");
  $("#del").css("display","block");
}

/* =============================================================
 * bootstrap-combobox.js v1.1.8
 * =============================================================
 * Copyright 2012 Daniel Farrell
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ============================================================ */

// Hello.
//
// This is JSHint, a tool that helps to detect errors and potential
// problems in your JavaScript code.
//
// To start, simply enter some JavaScript anywhere on this page. Your
// report will appear on the right side.
//
// Additionally, you can toggle specific options in the Configure
// menu.

(function( $ ) {
  
   "use strict";
  
   /* COMBOBOX PUBLIC CLASS DEFINITION
    * ================================ */
  
    var Combobox = function ( element, options ) {
      this.options = $.extend({}, $.fn.combobox.defaults, options);
      this.template = this.options.template || this.template;
      this.$source = $(element);
      this.$container = this.setup();
      this.$element = this.$container.find('input[type=text]');
      this.$target = this.$container.find('input[type=hidden]');
      this.$button = this.$container.find('.dropdown-toggle');
      this.$menu = $(this.options.menu).appendTo('body');
      this.matcher = this.options.matcher || this.matcher;
      this.sorter = this.options.sorter || this.sorter;
      this.highlighter = this.options.highlighter || this.highlighter;
      this.shown = false;
      this.selected = false;
      this.refresh();
      this.transferAttributes();
      this.listen();
    };
  
    Combobox.prototype = {
  
      constructor: Combobox,setup: function () {
        var combobox = $(this.template());
        this.$source.before(combobox);
        this.$source.hide();
        return combobox;
      },disable: function() {
        this.$element.prop('disabled', true);
        this.$button.attr('disabled', true);
        this.disabled = true;
        this.$container.addClass('combobox-disabled');
      },enable: function() {
        this.$element.prop('disabled', false);
        this.$button.attr('disabled', false);
        this.disabled = false;
        this.$container.removeClass('combobox-disabled');
      },parse: function () {
        var that = this,map = {},source = [],selected = false,selectedValue = '';
        this.$source.find('option').each(function() {
          var option = $(this);
          if (option.val() === '') {
            that.options.placeholder = option.text();
            return;
          }
          map[option.text()] = option.val();
          source.push(option.text());
          if (option.prop('selected')) {
            selected = option.text();
            selectedValue = option.val();
          }
        });
        this.map = map;
        if (selected) {
          this.$element.val(selected);
          this.$target.val(selectedValue);
          this.$container.addClass('combobox-selected');
          this.selected = true;
        }
        return source;
      },transferAttributes: function() {
      this.options.placeholder = this.$source.attr('data-placeholder') || this.options.placeholder;
      if(this.options.appendId !== "undefined") {
        this.$element.attr('id', this.$source.attr('id') + this.options.appendId);
      }
      this.$element.attr('placeholder', this.options.placeholder);
      this.$target.prop('name', this.$source.prop('name'));
      this.$target.val(this.$source.val());
      this.$source.removeAttr('name');  // Remove from source otherwise form will pass parameter twice.
      this.$element.attr('required', this.$source.attr('required'));
      this.$element.attr('rel', this.$source.attr('rel'));
      this.$element.attr('title', this.$source.attr('title'));
      this.$element.attr('class', this.$source.attr('class'));
      this.$element.attr('tabindex', this.$source.attr('tabindex'));
      this.$source.removeAttr('tabindex');
      if (this.$source.attr('disabled')!==undefined)
        this.disable();
    },select: function () {
        var val = this.$menu.find('.active').attr('data-value');
        this.$element.val(this.updater(val)).trigger('change');
        this.$target.val(this.map[val]).trigger('change');
        this.$source.val(this.map[val]).trigger('change');
        this.$container.addClass('combobox-selected');
        this.selected = true;
        return this.hide();
      },updater: function (item) {
        return item;
      },show: function () {
        var pos = $.extend({}, this.$element.position(), {
          height: this.$element[0].offsetHeight
        });
  
        this.$menu
          .insertAfter(this.$element)
          .css({
            top: pos.top + pos.height, left: pos.left
          })
          .show();
  
        $('.dropdown-menu').on('mousedown', $.proxy(this.scrollSafety, this));
  
        this.shown = true;
        return this;
      },hide: function () {
        this.$menu.hide();
        $('.dropdown-menu').off('mousedown', $.proxy(this.scrollSafety, this));
        this.$element.on('blur', $.proxy(this.blur, this));
        this.shown = false;
        return this;
      }, lookup: function (event) {
        this.query = this.$element.val();
        return this.process(this.source);
      }, process: function (items) {
        var that = this;
  
        items = $.grep(items, function (item) {
          return that.matcher(item);
        });
  
        items = this.sorter(items);
  
        if (!items.length) {
          return this.shown ? this.hide() : this;
        }
  
        return this.render(items.slice(0, this.options.items)).show();
      }, template: function() {
        if (this.options.bsVersion == '2') {
          return '<div class="combobox-container"><input type="hidden" /> <div class="input-append"> <input type="text" autocomplete="off" /> <span class="add-on dropdown-toggle" data-dropdown="dropdown"> <span class="caret"/> <i class="icon-remove"/> </span> </div> </div>';
        } else {
          return '<div class="combobox-container"> <input type="hidden" /> <div class="input-group"> <input type="text" autocomplete="off" /> <span class="input-group-addon dropdown-toggle" data-dropdown="dropdown"> <span class="caret" /> <span class="glyphicon glyphicon-remove" /> </span> </div> </div>';
        }
      }, matcher: function (item) {
        return ~item.toLowerCase().indexOf(this.query.toLowerCase());
      }, sorter: function (items) {
        var beginswith = [],caseSensitive = [],caseInsensitive = [],item;
  
        while (item = items.shift()) {
          if (!item.toLowerCase().indexOf(this.query.toLowerCase())) {beginswith.push(item);}
          else if (~item.indexOf(this.query)) {caseSensitive.push(item);}
          else {caseInsensitive.push(item);}
        }
  
        return beginswith.concat(caseSensitive, caseInsensitive);
      }, highlighter: function (item) {
        var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&');
        return item.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
          return '<strong>' + match + '</strong>';
        });
      }, render: function (items) {
        var that = this;
  
        items = $(items).map(function (i, item) {
          i = $(that.options.item).attr('data-value', item);
          i.find('a').html(that.highlighter(item));
          return i[0];
        });
  
        items.first().addClass('active');
        this.$menu.html(items);
        return this;
      },next: function (event) {
        var active = this.$menu.find('.active').removeClass('active'),next = active.next();
  
        if (!next.length) {
          next = $(this.$menu.find('li')[0]);
        }
  
        next.addClass('active');
      },prev: function (event) {
        var active = this.$menu.find('.active').removeClass('active'),prev = active.prev();
  
        if (!prev.length) {
          prev = this.$menu.find('li').last();
        }
  
        prev.addClass('active');
      },toggle: function () {
      if (!this.disabled) {
        if (this.$container.hasClass('combobox-selected')) {
          this.clearTarget();
          this.triggerChange();
          this.clearElement();
        } else {
          if (this.shown) {
            this.hide();
          } else {
            this.clearElement();
            this.lookup();
          }
        }
      }
    },scrollSafety: function(e) {
        if (e.target.tagName == 'UL') {
            this.$element.off('blur');
        }
    },clearElement: function () {
      this.$element.val('').focus();
    }, clearTarget: function () {
      this.$source.val('');
      this.$target.val('');
      this.$container.removeClass('combobox-selected');
      this.selected = false;
    }, triggerChange: function () {
      this.$source.trigger('change');
    }, refresh: function () {
      this.source = this.parse();
      this.options.items = this.source.length;
    }, listen: function () {
        this.$element
          .on('focus',    $.proxy(this.focus, this))
          .on('blur',     $.proxy(this.blur, this))
          .on('keypress', $.proxy(this.keypress, this))
          .on('keyup',    $.proxy(this.keyup, this));
  
        if (this.eventSupported('keydown')) {
          this.$element.on('keydown', $.proxy(this.keydown, this));
        }
  
        this.$menu
          .on('click', $.proxy(this.click, this))
          .on('mouseenter', 'li', $.proxy(this.mouseenter, this))
          .on('mouseleave', 'li', $.proxy(this.mouseleave, this));
  
        this.$button
          .on('click', $.proxy(this.toggle, this));
      }, eventSupported: function(eventName) {
        var isSupported = eventName in this.$element;
        if (!isSupported) {
          this.$element.setAttribute(eventName, 'return;');
          isSupported = typeof this.$element[eventName] === 'function';
        }
        return isSupported;
      }, move: function (e) {
        if (!this.shown) {return;}
  
        switch(e.keyCode) {
          case 9: // tab
          case 13: // enter
          case 27: // escape
            e.preventDefault();
            break;
  
          case 38: // up arrow
            e.preventDefault();
            this.prev();
            this.fixMenuScroll();
            break;
  
          case 40: // down arrow
            e.preventDefault();
            this.next();
            this.fixMenuScroll();
            break;
        }
  
        e.stopPropagation();
      }, fixMenuScroll: function(){
        var active = this.$menu.find('.active');
        if(active.length){
            var top = active.position().top;
            var bottom = top + active.height();
            var scrollTop = this.$menu.scrollTop();
            var menuHeight = this.$menu.height();
            if(bottom > menuHeight){
                this.$menu.scrollTop(scrollTop + bottom - menuHeight);
            } else if(top < 0){
                this.$menu.scrollTop(scrollTop + top);
            }
        }
    }, keydown: function (e) {
        this.suppressKeyPressRepeat = ~$.inArray(e.keyCode, [40,38,9,13,27]);
        this.move(e);
      }, keypress: function (e) {
        if (this.suppressKeyPressRepeat) {return;}
        this.move(e);
      }, keyup: function (e) {
        switch(e.keyCode) {
          case 40: // down arrow
           if (!this.shown){
             this.toggle();
           }
           break;
          case 39: // right arrow
          case 38: // up arrow
          case 37: // left arrow
          case 36: // home
          case 35: // end
          case 16: // shift
          case 17: // ctrl
          case 18: // alt
            break;
  
          case 9: // tab
          case 13: // enter
            if (!this.shown) {return;}
            this.select();
            break;
  
          case 27: // escape
            if (!this.shown) {return;}
            this.hide();
            break;
  
          default:
            this.clearTarget();
            this.lookup();
        }
  
        e.stopPropagation();
        e.preventDefault();
    }, focus: function (e) {
        this.focused = true;
      }, blur: function (e) {
        var that = this;
        this.focused = false;
        var val = this.$element.val();
        if (!this.selected && val !== '' ) {
          this.$element.val('');
          this.$source.val('').trigger('change');
          this.$target.val('').trigger('change');
        }
        if (!this.mousedover && this.shown) {setTimeout(function () { that.hide(); }, 200);}
      }, click: function (e) {
        e.stopPropagation();
        e.preventDefault();
        this.select();
        this.$element.focus();
      }, mouseenter: function (e) {
        this.mousedover = true;
        this.$menu.find('.active').removeClass('active');
        $(e.currentTarget).addClass('active');
      }, mouseleave: function (e) {
        this.mousedover = false;
      }
    };
  
    /* COMBOBOX PLUGIN DEFINITION
     * =========================== */
    jQuery.fn.combobox = function ( option ) {
      return this.each(function () {
        var $this = $(this), data = $this.data('combobox'), options = typeof option == 'object' && option;
        if(!data) {$this.data('combobox', (data = new Combobox(this, options)));}
        if (typeof option == 'string') {data[option]();}
      });
    };
  
    $.fn.combobox.defaults = {
      bsVersion: '4', menu: '<ul class="typeahead typeahead-long dropdown-menu"></ul>', item: '<li><a href="#" class="dropdown-item"></a></li>'
    };
  
    $.fn.combobox.Constructor = Combobox;
  
  }( window.jQuery ));
  