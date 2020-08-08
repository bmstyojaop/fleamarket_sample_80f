$(function() {
  return $("#sending_destination_postcode").jpostal({
    postcode: ["#sending_destination_post_code"],
    address: {
      "#sending_destination_prefecture_code": "%3",
      "#sending_destination_address_city": "%4",
      "#sending_destination_address_street": "%5%6%7"
    }
  });
});