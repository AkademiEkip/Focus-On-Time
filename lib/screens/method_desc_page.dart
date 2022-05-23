import 'package:flutter/material.dart';

class MetotTanitimi extends StatelessWidget {
  const MetotTanitimi({Key? key}) : super(key: key);
    final _pomodoroImage = 'images/pomodoro.jpg';
  final _eisenhowerImage = 'images/eisenhower.jpg';
  final _timeBlokImage = 'images/timeblock.jpg';
  final _kanbanImage = 'images/kanban.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(),
       body: Center(
         child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: _metotTanitimPadding(),
                child: Column(
                  children: [
                     Padding(
                       padding: _metotTanitimPadding(),
                       child: Text(
                        'Pomodoro Sayacı',
                        style: _metotBaslikStyle(),
                    ),
                     ),
                    Padding(
                      padding: _metotTanitimPadding(),
                      child: Image.asset(_pomodoroImage),
                    ),
                   
                    Padding(
                      padding: _metotTanitimPadding(),
                      child: PomodoroAciklama(),
                    ),
                     Padding(
                       padding:  _metotTanitimPadding(),
                       child: Text(
                        'Eisenhower Matrisi',
                        style: _metotBaslikStyle(),
                    ),
                     ),
                    Padding(
                      padding: _metotTanitimPadding(),
                      child: Image.asset(_eisenhowerImage),
                    ),
                   
                    Padding(
                      padding: _metotTanitimPadding(),
                      child: EinsenhowerAciklama(),
                    ),
                    Text(
                      'Zaman Bloklama Metodu',
                      style: _metotBaslikStyle(),
                    ),
                    Padding(
                      padding: _metotTanitimPadding(),
                      child: Image.asset(_timeBlokImage),
                    ),
                    Padding(
                      padding: _metotTanitimPadding(),
                      child: BlokZamanAciklama(),
                    ),
                    
                      Padding(
                        padding:_metotTanitimPadding(),
                        child: Text(
                        'Kanban Metodu',
                          style: _metotBaslikStyle(),
                        ),
                      ),
                    
                    Padding(
                      padding: _metotTanitimPadding(),
                      child: Image.asset(_kanbanImage),
                    ),
                    Padding(
                      padding: _metotTanitimPadding(),
                      child: KanbanAciklama(),
                    ),
                  ],
                ),
              ),
            ),
          ),
       ),
    );
  }
}
 EdgeInsets _metotTanitimPadding() => const EdgeInsets.all(8.0);

  TextStyle _metotBaslikStyle() => TextStyle(
      color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.bold);


class KanbanAciklama extends StatelessWidget {
  const KanbanAciklama({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Kanban metodolojisi, bir projeyi, yönetimi kolaylaştıran ve eyleme geçirilebilir parçalara ayırmak için sütun ve kartlardan oluşan bir panonun kullanıldığı görsel bir stratejidir.\nBir projedeki tüm görevleri iş akışındaki geçerli aşamalarına göre listelemek için sütunlar ve kartları kullanır. Dolayısıyla, yapılacaklar listeleriniz gibi, bir Kanban panosu görevleri 'Yapılacaklar', 'Devam Ediyor' ve 'Tamamlandı' gibi başlıklar altında sınıflandırır.",
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}

class BlokZamanAciklama extends StatelessWidget {
  const BlokZamanAciklama({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Blok zaman ayırmak, verimliliğinizi artırmak için güçlü bir araçtır. Sizi ve gününüzü zaman bloklarına bölmenizi isteyen bir zaman yönetimi metodudur. Her blok, belirli bir görevi veya görev grubunu ve yalnızca bu belirli görevleri gerçekleştirmeye adanır.\nMümkün olduğunca elde edeceğiniz şeylerin açık uçlu bir yapılacaklar listesini tutmak yerine, her gün ne üzerinde ve ne zaman çalışacağınızı düzenleyen somut bir programlama biçimidir.",
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}

class EinsenhowerAciklama extends StatelessWidget {
  const EinsenhowerAciklama({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Eisenhower Matrisi, işlerin aciliyetlerine göre sıralanmasını sağlayan bir tekniktir.\nEisenhower Matrisi ile yapmayı düşündüğünüz işleri 4 kategoriye ayırırsınız: \n1- Acil – Önemli: Öncelik sıramızın en başına gelmesi gereken işlerdir. Bu işleri hemen yapmalıyız.\n2-Acil Değil – Önemli: Geleceğinizde gerçek fark yaratan uzun vadeli planlarınızın olduğu, gerçekten kendi isteklerinizle belirlediğiniz bölge.\n3-Önemli Değil -Acil: Genelde gelen e-mailler, çalan telefonlar, iş yerinde başkalarının kendileri için sizden istedikleri vs buna girer. Eğer yapabiliyorsanız bu işleri başkasına devredin.\n4-Önemli Değil-Acil Değil: Yapsanız iyi olur ama yapmasanız da hayatınızda çok şey farkettirmeyecek işlerdir.",
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}

class PomodoroAciklama extends StatelessWidget {
  const PomodoroAciklama({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Pomodoro tekniği, sahip olunan zamanın belli periyotlara bölünmesi, o periyotlarda da çalışma ve dinlenme eylemlerinin bir arada kullanılması yöntemidir. Bu tekniğin içeriğinde 25 dakika boyunca yalnızca yapmanız gereken işe odaklanmanız ve sonrasında 5 dakikalık kısa bir mola vermeniz beklenmektedir.Bu periyodu 4 kez uyguladığınızda ise 30 dakikalık büyük bir mola vermeniz gerekmektedir.\nGün içerisinde 6 ila 12 adet pomodoro tekniği uygulamak gün içerisinde yapmanız gereken işler için oldukça ideal sayılmaktadır.",
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}
