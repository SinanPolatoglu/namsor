# for GET / content / add_headers
#' @import httr

BASE_URL = 'https://v2.namsor.com/NamSorAPIv2'

namsor_pat <- function() {
  pat <- Sys.getenv("NAMSOR_API_KEY")
  if (identical(pat, "")) {
    stop("Please set your API key with `Sys.setenv(NAMSOR_API_KEY='your api key')`", call. = FALSE)
  }
  pat
}
namsor_GET = function(url){
  url = utils::URLencode(url)
  httr::GET(url, httr::add_headers(
    .headers = c("X-API-KEY"= namsor_pat(), 'Accept'='application/json'))
  )
}

return_response = function(response){
  STATUS_CODE = response$status_code
  if (STATUS_CODE == 200)
    return(httr::content(response))
  else{

    ERROR = list(
      '401' = "Unauthorized: missing or incorrect API Key.",
      '403' = "Forbidden: API Limit Reached or API Key Disabled.",
      '404' = "Not Found: the specified route could not be found.",
      '500' = "Internal Server Error: Server error. Try again later."
    )[[as.character(STATUS_CODE)]]

    ERROR = paste(ERROR, '\nReturning http response')

    warning(ERROR)
    return(response)
  }
}


check_first_last_name = function(firstName, lastName){
  if (!all(
    is.character(firstName) &
    is.character(lastName)  &
    length(firstName) == 1  &
    length(lastName) == 1
  ))
    stop('firstName and lastName should both be a single character value.')
}
