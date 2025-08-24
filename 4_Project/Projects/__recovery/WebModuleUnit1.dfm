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
      'Password=Varazol1'
      'User_Name=root'
      'Server=localhost'
      'Database=librarydb'
      'DriverID=MySQL')
    Left = 168
    Top = 80
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM Books')
    Left = 56
    Top = 88
  end
end
