//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require popper
//= require bootstrap

//= require autosaveform



$(document).ready(function(){

     var formsave1=new autosaveform({
          formid: 'feedbackform',
          pause: 1000 //<--no comma following last option!
        }); 


        var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-36251023-1']);
      _gaq.push(['_trackPageview']);

      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();

        $('#cashbook_index').dataTable();

            setTimeout(function() {
                $('.alert').fadeOut("slow", function() {
                    $(this).remove();
                });     
            }, 3000);


    // for add row dynamic in quotation/new
    $('form').on('click', '.add_credits', function(event) {
        
       var time, regexp;
        time = new Date().getTime()
        regexp = new RegExp($(this).data('id'), 'g');
        $('.credits_fields').append($(this).data('fields').replace(regexp, time));
        

    });
  

    // for remove row dynamic in quotation/new
    $('form').on('click', '.remove_record', function(event) {
        $(this).parents('.item-row').remove();
        if ($('.remove_record').length < 2) $('.remove_record').hide();
        
    });

    ///////////////////


    $('form').on('click', '.add_debits', function(event) {
       var time, regexp;
        time = new Date().getTime()
        regexp = new RegExp($(this).data('id'), 'g');
        $('.debits_fields').append($(this).data('fields').replace(regexp, time));
    });

    // for remove row dynamic in quotation/new
    $('form').on('click', '.remove_record', function(event) {
        $(this).parents('.item-row').remove();
        if ($('.remove_record').length < 2) $('.remove_record').hide();
        
    });

    window.onload = function() {
        // $('#cashbook-table').dataTable();
        var values = [2000, 500, 200, 100, 50, 20, 10, 5, 2, 1];
        // var value denomination

        // alert(values);
        for (var i = 0; i < values.length; i++){
            // $('#cashbook_index_opening_cashes_attributes_'+ i +'_denomination').val(values[i]);
            $('#cashbook_index_closing_cashes_attributes_'+ i +'_denomination').val(values[i]);
        }
        editAmountTotal();
        grandTotalClosingGranttotal();
        grandTotalcredit();
        grandTotaldebit();
        currentCashInHand();
        diffrenceInCash();
        
        
    };


    jQuery(function() {
        return $(document).on("input",".quantity",function(){

            quantity = $(this).val();

            fetchValue = $(this).parent('td').prev('td').children('.denomination').val();

            var result = quantity * fetchValue;

            $(this).parent('td').next('td').children('.closing-amount').val(result);


           grandTotalClosingGranttotal();
           diffrenceInCash();
        });
    });

    jQuery(function() {
        return $(document).on("input",".credit-amount",function(){
            grandTotalcredit();
            currentCashInHand();
            diffrenceInCash();
        });
    });


    jQuery(function() {
        return $(document).on("input",".debit-amount",function(){

            grandTotaldebit();
            currentCashInHand();
            diffrenceInCash();
        });
    });




});


// function grandTotalOpeningGranttotal(){
//   var subtotal = 0;
//     $('.opening-amount').each(function(i){
//         var price = $(this).val();
//         if (!isNaN(price)) subtotal += Number(price);
//     });

//     subtotal = subtotal.toFixed(2);
//     $('.opening_cashesgrandtotal').html(subtotal);
// }

function grandTotalClosingGranttotal(){
  var subtotal = 0;
    $('.closing-amount').each(function(i){
        var price = $(this).val();
        if (!isNaN(price)) subtotal += Number(price);
    });

    subtotal = subtotal.toFixed(2);
    $('.closing_cashesgrandtotal').val(subtotal);
}

function grandTotalcredit(){
  var subtotal = 0;
    $('.credit-amount').each(function(i){
        var price = $(this).val();
        if (!isNaN(price)) subtotal += Number(price);
    });

    subtotal = subtotal.toFixed(2);
    $('.credit-grandTotal').val(subtotal);
}

function grandTotaldebit(){
  var subtotal = 0;
    $('.debit-amount').each(function(i){
        var price = $(this).val();
        if (!isNaN(price)) subtotal += Number(price);
    });

    subtotal = subtotal.toFixed(2);
    $('.debit-grandTotal').val(subtotal);
}



function currentCashInHand(){
    var crTotal = $('.credit-grandTotal').val();
    var drTotal = $('.debit-grandTotal').val();

    var diffrence = crTotal - drTotal;
    diffrence = diffrence.toFixed(2);
    $('.cash-in-hand-total').val(diffrence);
}

function diffrenceInCash(){
    var cashInHand = $('.cash-in-hand-total').val();
    var opening_cashesgrandtotal = $('.closing_cashesgrandtotal').val();

    var diffrence = opening_cashesgrandtotal - cashInHand;
    diffrence = diffrence.toFixed(2);
    $('.differenceofcashclosing').html(diffrence);
}

function editAmountTotal() {
    var grandTotal = 0;
    for (var i = 0; i < 10; i++){
        var selectQuantity = $('#cashbook_index_closing_cashes_attributes_'+ i +'_quantity').val();
        var selectValue = $('#cashbook_index_closing_cashes_attributes_'+ i +'_denomination').val();
        var total = selectQuantity * selectValue;
        total = total.toFixed(2);
        $('#cashbook_index_closing_cashes_attributes_'+ i +'_total').val(total);
        grandTotal += total;
    }
    
    $('#cashbook_index_closing_total').val(grandTotal);

}

