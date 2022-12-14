unit untTabuada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmTabuada = class(TForm)
    edtInicio: TEdit;
    edtFim: TEdit;
    edtInicio2: TLabel;
    edtFim2: TLabel;
    memRes: TMemo;
    edtResultado2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    edtAte: TEdit;
    Label1: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTabuada: TfrmTabuada;

implementation

{$R *.dfm}

procedure TfrmTabuada.BitBtn1Click(Sender: TObject);
var inicio, fim, cont, ate, res: integer;
begin
  if (edtInicio.Text = '') or (edtFim.Text = '') or (edtAte.Text = '') then
begin
  application.MessageBox('Preencha todos os campos!', ' Aten??o');
end
else
begin

      inicio := StrToInt(edtInicio.Text);
      fim := StrToInt(edtFim.Text);
      ate := StrToInt(edtAte.Text);

    if inicio > fim then
    begin
      Application.MessageBox('L?gica inv?lida', ' Aten??o')
    end
    else
    begin
      while (inicio <= fim) do
      begin
        cont := 0;
        while cont <= ate do
        begin
          res := inicio * cont;
          memRes.Lines.Add(intToStr(Inicio)+' X '+ IntToStr(cont)+ ' = '
          + IntToStr(res));
          cont := cont + 1;
        end;
        inicio := inicio + 1;
        memRes.Lines.add('___________');
      end;

      edtInicio.Clear;
      edtFim.Clear;
      edtAte.Clear;
    end;


end;


end;

procedure TfrmTabuada.BitBtn2Click(Sender: TObject);
begin
      edtInicio.Clear;
      edtFim.Clear;
      edtAte.Clear;
      memRes.Clear;
      edtInicio.SetFocus;
end;

procedure TfrmTabuada.BitBtn3Click(Sender: TObject);
begin
      if application.MessageBox('Deseja Sair?',' Confirme',
      MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = idyes then
          close;

end;

procedure TfrmTabuada.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if key = vk_f1 then
          bitBtn1.click;
      if key = vk_f2 then
          bitBtn2.click;
      if key = vk_escape then
          bitBtn3.click;
end;

end.
