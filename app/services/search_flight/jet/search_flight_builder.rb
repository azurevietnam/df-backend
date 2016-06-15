class SearchFlight::Jet::SearchFlightBuilder
  def initialize(uri, params)
    @uri = uri
    @params = params
  end

  def url
    url = String.new(@uri)
    url << '/Search.aspx?culture=vi-VN'
  end

  def options
    if Order::OrderRoundType.is_round_trip(@params.round_type)
      body = {
        "search-origin01"                                                                           => '',
        "search-destination01"                                                                      => '',
        "ControlGroupSearchView$ButtonSubmit"                                                       => '',
        "__VIEWSTATE"                                                                               => '',
        "undefined"                                                                                 => '',
        "children"                                                                                  => @params.child,
        "infants"                                                                                   => @params.infant,
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$DropDownListPassengerType_INFANT" => @params.infant,
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$DropDownListPassengerType_CHD"    => @params.child,
        "datedepart-01"                                                                             => format_date(@params.depart_date),
        "datereturn-01"                                                                             => format_date(@params.return_date),
        "adults"                                                                                    => @params.adult,
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$DropDownListMarketDay1"           => format_day(@params.depart_date),
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$DropDownListPassengerType_ADT"    => @params.adult,
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$DropDownListMarketDay2"           => format_day(@params.return_date),
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$DropDownListMarketMonth1"         => format_month(@params.depart_date),
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$DropDownListMarketMonth2"         => format_month(@params.return_date),
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$TextBoxMarketOrigin1"             => @params.ori_code,
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$DropDownListFareTypes"            => 'I',
        "_pe_39b5379c652b_9df496572198"                                                             => 'null',
        "travel-indicator"                                                                          => 'on',
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$RadioButtonMarketStructure"       => get_round_type(@params.round_type),
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$TextBoxMarketDestination1"        => @params.des_code,
        "pageToken"                                                                                 => 'sLkmnwXwAsY=',
        "culture"                                                                                   => 'vi-VN',
        "locale"                                                                                    => 'vi-VN',
        "currencyPicker"                                                                            => 'VND',
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$DropDownListCurrency"             => 'VND'
      }
    else
      body = {
        "search-origin01"                                                                           => '',
        "search-destination01"                                                                      => '',
        "__VIEWSTATE"                                                                               => '',
        "datereturn-01"                                                                             => '',
        "ControlGroupSearchView$ButtonSubmit"                                                       => '',
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$DropDownListPassengerType_INFANT" => @params.infant,
        "infants"                                                                                   => @params.infant,
        "children"                                                                                  => @params.child,
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$DropDownListPassengerType_CHD"    => @params.child,
        "adults"                                                                                    => @params.adult,
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$DropDownListPassengerType_ADT"    => @params.adult,
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$DropDownListMarketMonth1"         => format_month(@params.depart_date),
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$DropDownListMarketDay1"           => format_day(@params.depart_date),
        "datedepart-01"                                                                             => format_date(@params.depart_date),
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$TextBoxMarketOrigin1"             => @params.ori_code,
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$DropDownListFareTypes"            => 'I',
        "travel-indicator"                                                                          => 'on',
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$RadioButtonMarketStructure"       => get_round_type(@params.round_type),
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$TextBoxMarketDestination1"        => @params.des_code,
        "pageToken"                                                                                 => 'sLkmnwXwAsY=',
        "culture"                                                                                   => 'vi-VN',
        "currencyPicker"                                                                            => 'VND',
        "ControlGroupSearchView$AvailabilitySearchInputSearchView$DropDownListCurrency"             => 'VND'
      }
    end

    options = {
      body: body,
      headers: {
              "Accept-Encoding" => "gzip, deflate",
              "Content-type" => "application/x-www-form-urlencoded"
              }
    }
    options
  end

  private
    def get_round_type(round_type)
      Order::OrderRoundType.is_round_trip(round_type) ? 'RoundTrip' : 'OneWay'
    end
    def format_day(date)
      DateFormatter.format_with_user_defined(date, '%d')
    end
    def format_date(date)
      DateFormatter.format_with_user_defined(date, '%d/%m/%Y')
    end
    def format_month(date)
      DateFormatter.format_with_user_defined(date, '%Y-%m')
    end
end
