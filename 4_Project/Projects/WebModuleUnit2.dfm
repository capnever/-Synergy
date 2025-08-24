object WebModule2: TWebModule2
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule2DefaultHandlerAction
    end>
  Height = 230
  Width = 415
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Server=localhost'
      'Database=librarydb'
      'User_Name=root'
      'Password=Varazol1')
    Left = 80
    Top = 40
  end
end
