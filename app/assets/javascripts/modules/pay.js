window.addEventListener(
  "turbolinks:load", e => {
    if (document.getElementById("token_submit") != null) { 
      Payjp.setPublicKey("pk_test_209b52d522239a08ceda7909"); 
      let btn = document.getElementById("token_submit"); 
      btn.addEventListener("click", e => { 
        e.preventDefault(); 
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        }; 
        console.table(card);
        Payjp.createToken(card, (status, response) => {
          if (status === 200) { 
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name"); 
            $("#card_token").append(
              $(`<input type="hidden" name="payjp-token" value=${response.id}>`)
            );
            const cardForm = document.querySelector('#charge-form');
            console.log(cardForm);
            cardForm.submit();
            alert("クレジットカードの登録が完了しました"); 
          } else {
              alert("カード情報が正しくありません。"); 
              console.table(response.error);
              console.log(response.error.message);
          }
        });
      });
    }
  },
);
