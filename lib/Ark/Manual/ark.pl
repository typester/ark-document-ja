=encoding utf-8

=head1 NAME

ark.pl - ヘルパースクリプト

=head1 DESCRIPTION

Ark にはアプリケーションのひな形作成や、テストサーバーの立ち上げなど、開発を助けるヘルパースクリプトが付属しています。

=head1 ひな形生成

=head2 アプリケーションのひな形作成

    ark.pl newapp ApplicationName

この newapp コマンドは C<ApplicationName> というディレクトリを作成しその中に Ark アプリケーションのひな形を生成します。

このコマンドだけがどの場所でも使用することができます。

その他のコマンドはアプリケーションディレクトリ上でしか動作しません。

=head2 Controller/View/Model などのひな形生成

    ark.pl controller|view|model [ClassName] [BaseClassName]

このコマンドはアプリケーションディレクトリで実行するとそのアプリケーションの指定されたクラスのひな形を生成します。

C<BaseClassName> は C<use Ark 'Controller';> などという宣言でしようするベースクラスを指定します。これは省略可能でその場合、controller なら Controller、とデフォルトのクラスがベースクラスとして指定されます。

例1、Rootという名前の普通のコントローラを作成

    ark.pl controller Root

例2、MT という名前の View::MT を継承したビューを作成

    ark.pl view MT View::MT

=head1 ひな形のテンプレートをカスタマイズする

C<ark.pl> のひな形生成機能は L<Module::Setup> をベースに開発されているので、L<Module::Setup> が提供するテンプレート機能を使用してテンプレートを自分好みに好きなようにカスタマイズすることができます。

また、複数のテンプレートを切り替えて使用することもできます。

    ark.pl newapp MyApp

というコマンドを例に見てみましょう。

=head2 カスタマイズしたテンプレートを使用する

上記のコマンドを実行すると実は裏で

    ~/.arkhelper/newapp/flavors/default

以下にそのコマンドで使用するテンプレートがはき出されています。

それを自分好みに編集した後、newapp コマンドを実行すると編集されたテンプレートでひな形を生成することができます。

=head2 複数のテンプレートを使用する

複数のテンプレートを使用したい場合は

    ark.pl newapp --flavor hoge MyApp

というように使用するテンプレート(flavor)を指定します。

この場合、

    ~/.arkhelper/newapp/flavors/hoge

の場所にあるテンプレートが使用されます。

=head2 テンプレートの書き出しのみを行いたい

上記に示したコマンド例はどれも MyApp ディレクトリにひな形を生成してしまいます。

テンプレートのみを ~/.arkhelper ディレクトリに書き出したい場合は

    ark.pl newapp --flavor mobile --init

と --init オプションを使用すれば実際にはひな形は生成されず、テンプレートのみが書き出されます。

=head1 開発用テストサーバーの起動

開発サーバーを使用するにはアプリケーションディレクトリで以下のコマンドを実行します。

    ark.pl server

このコマンドを実行するとそのディレクトリのアプリケーションを自動判別し、テストサーバーが立ち上がります。アクセスするには

    http://localhost:4423/

にアクセスします。

ポート番号、bindアドレスなどはそれぞれコマンドラインオプションでカスタマイズすることができます。

    ark.pl server -p 4423 -a 0.0.0.0

また C<-d> オプションでデバッグモードでテストサーバーを起動することができます。

デバッグモードでは開発に便利な様々な情報をコンソールに表示することが可能です。

オプションの一覧は

    ark.pl server --help

を実行すると得られます。
