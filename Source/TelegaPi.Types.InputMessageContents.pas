unit TelegaPi.Types.InputMessageContents;

interface

uses
  DJSON.Attributes;

type
  /// <summary>
  ///   This object represents the content of a message to be sent as a result
  ///   of an inline query.
  /// </summary>
  TtgInputMessageContent = class(TObject);

  /// <summary>
  ///   Represents the content of a contact message to be sent as the result of
  ///   an inline query.
  /// </summary>
  TtgInputContactMessageContent = class(TtgInputMessageContent)
  public
    /// <summary>
    ///   Contact's phone number
    /// </summary>
    [djName('phone_number')]
    PhoneNumber: string;
    /// <summary>
    ///   Contact's first name
    /// </summary>
    [djName('first_name')]
    FirstName: string;
    /// <summary>
    ///   Optional. Contact's last name
    /// </summary>
    [djName('last_name')]
    LastName: string;
    constructor Create(const APhoneNumber, AFirstName, ALastName: string);
  end;

  /// <summary>
  ///   Represents the content of a location message to be sent as the result
  ///   of an inline query.
  /// </summary>
  TtgInputLocationMessageContent = class(TtgInputMessageContent)
  public
    /// <summary>
    ///   Latitude of the location in degrees
    /// </summary>
    [djName('latitude')]
    Latitude: Single;
    /// <summary>
    ///   Longitude of the location in degrees
    /// </summary>
    [djName('longitude')]
    Longitude: Single;
    constructor Create(ALatitude, ALongitude: Single);
  end;

  /// <summary>
  ///   Represents the content of a text message to be sent as the result of an
  ///   inline query.
  /// </summary>
  TtgInputTextMessageContent = class(TtgInputMessageContent)
  public
    /// <summary>
    ///   Text of the message to be sent, 1-4096 characters
    /// </summary>
    [djName('message_text')]
    MessageText: string;
    /// <summary>
    ///   Optional. Send Markdown or HTML, if you want Telegram apps to show
    ///   bold, italic, fixed-width text or inline URLs in your bot's message.
    /// </summary>
    [djName('parse_mode')]
    ParseMode: string;
    /// <summary>
    ///   Optional. Disables link previews for links in the sent message
    /// </summary>
    [djName('disable_web_page_preview')]
    DisableWebPagePreview: Boolean;
    constructor Create(const AMessageText, AParseMode: string; ADisableWebPagePreview: Boolean);
  end;

  /// <summary>
  ///   Represents the content of a venue message to be sent as the result of
  ///   an inline query.
  /// </summary>
  TtgInputVenueMessageContent = class(TtgInputMessageContent)
  public
    /// <summary>
    ///   Latitude of the venue in degrees
    /// </summary>
    [djName('latitude')]
    Latitude: Single;
    /// <summary>
    ///   Longitude of the venue in degrees
    /// </summary>
    [djName('longitude')]
    Longitude: Single;
    /// <summary>
    ///   Name of the venue
    /// </summary>
    [djName('title')]
    Title: string;
    /// <summary>
    ///   Address of the venue
    /// </summary>
    [djName('address')]
    Address: string;
    /// <summary>
    ///   Optional. Foursquare identifier of the venue, if known
    /// </summary>
    [djName('foursquare_id')]
    FoursquareId: string;
    constructor Create(ALatitude, ALongitude: Single; const ATitle, AAddress, AFoursquareId: string);
  end;

implementation

{ TtgInputTextMessageContent }

constructor TtgInputTextMessageContent.Create(const AMessageText, AParseMode: string; ADisableWebPagePreview: Boolean);
begin
  MessageText := AMessageText;
  ParseMode := AParseMode;
  DisableWebPagePreview := ADisableWebPagePreview;
end;

{ TtgInputContactMessageContent }

constructor TtgInputContactMessageContent.Create(const APhoneNumber, AFirstName, ALastName: string);
begin
  PhoneNumber := APhoneNumber;
  FirstName := AFirstName;
  LastName := ALastName;
end;

{ TtgInputLocationMessageContent }

constructor TtgInputLocationMessageContent.Create(ALatitude, ALongitude: Single);
begin
  Latitude := ALatitude;
  Longitude := ALongitude;
end;

{ TtgInputVenueMessageContent }

constructor TtgInputVenueMessageContent.Create(ALatitude, ALongitude: Single; const ATitle, AAddress, AFoursquareId: string);
begin
  Latitude := ALatitude;
  Longitude := ALongitude;
  Title := ATitle;
  Address := AAddress;
  FoursquareId := AFoursquareId;
end;

end.

