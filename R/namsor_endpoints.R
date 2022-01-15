#' Obtain gender estimation for a name
#' @param firstName First name
#' @param lastName Last name
#' @importFrom glue glue
#' @return Returns the most likely gender of a first name and a last name.
#' @examples
#' \dontrun{namsor_gender('John','Doe')}
#' @export
namsor_gender = function(firstName, lastName) {
  check_first_last_name(firstName, lastName)
  url = glue::glue("{BASE_URL}/api2/json/gender/{firstName}/{lastName}")
  output = namsor_GET(url)
  return_response(output)
}

#' Obtain country of origin estimation for a name
#' @param firstName First name
#' @param lastName Last name
#' @importFrom glue glue
#' @return Returns the most likely country of origin of a first name and a last name. Note that the “Diaspora” endpoint may be better suited for multicultural countries like the U.S.A., Canada, Russia, etc.
#' @examples
#' \dontrun{namsor_origin('John','Doe')}
#' @export
namsor_origin = function(firstName, lastName) {
  check_first_last_name(firstName, lastName)
  url = glue::glue("{BASE_URL}/api2/json/origin/{firstName}/{lastName}")
  output = namsor_GET(url)
  return_response(output)
}


#' Obtain country of residence estimation for a name
#' @param firstName First name
#' @param lastName Last name
#' @importFrom glue glue
#' @return Returns the most likely geographic context of a full name (first name and last name) or a surname.
#' @examples
#' \dontrun{namsor_country('John','Doe')}
#' @export
namsor_country = function(firstName='', lastName){
  # first name optional for this endpoint, default arg used
  check_first_last_name(firstName, lastName)

  # paste name
  if (identical(firstName, ''))
    fullname = lastName
  else
    fullname = paste(firstName, lastName)

  url = glue::glue("{BASE_URL}/api2/json/country/{fullname}")
  output = namsor_GET(url)
  return_response(output)
}


#' Obtain country of residence estimation for a name
#' @param firstName First name
#' @param lastName Last name
#' @param cntryResid Country of residence as a 2-character ISO code. See namsor::namsor_country_to_iso for options
#' @importFrom glue glue
#' @return Returns the most likely ethnicity or diaspora of a first name and last name, according to the country of residence.
#' @examples
#' \dontrun{namsor_diaspora('John','Doe', 'BE')}
#' @export
namsor_diaspora = function(firstName, lastName, cntryResid) {
  if (!(cntryResid %in% names(namsor_iso_to_country)))
    stop('cntryResid should be an 2-character ISO code. Please check namsor::namsor_country_to_iso')
  check_first_last_name(firstName, lastName)
  url = glue::glue("{BASE_URL}/api2/json/diaspora/{cntryResid}/{firstName}/{lastName}")
  output = namsor_GET(url)
  return_response(output)
}
