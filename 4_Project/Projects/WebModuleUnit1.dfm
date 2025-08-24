object WebModule1: TWebModule1
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end>
  Height = 230
  Width = 415
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Password=Varazol1'
      'User_Name=root'
      'Server=localhost'
      'Database=librarydb')
    Left = 168
    Top = 80
  end
end
