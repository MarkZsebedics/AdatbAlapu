drop table bejegyzestemaja;
drop table forumbejegyzes;
drop table felhasznaloversenye;
drop table verseny;
drop table felhasznaloszobaja;
drop table eredmeny;
drop table kerdesvalasza;
drop table felhasznalo;
drop table kerdesSorTemaja;
drop table kerdes;
drop table kerdessor;
drop table szoba;
drop table nehezseg;
drop table valasz;
drop table tema;
drop table lakhely;

create table lakhely(

    lakhelyAzon NUMBER GENERATED ALWAYS AS IDENTITY  START WITH 1 INCREMENT BY 1 primary key,
    megye varchar2(40),
    varos varchar2(40)
);

create table tema(
    temaAzon NUMBER GENERATED ALWAYS AS IDENTITY  START WITH 1 INCREMENT BY 1 primary key,
    nev varchar2(40)
);

create table valasz(
    valaszAzon NUMBER GENERATED ALWAYS AS IDENTITY  START WITH 1 INCREMENT BY 1 primary key,
    nev varchar2(300),
    helyesseg  char(1)
);

create table nehezseg(
    nehezsegAzon NUMBER GENERATED ALWAYS AS IDENTITY  START WITH 1 INCREMENT BY 1 primary key,
    nev varchar2(50)
);

create table szoba(
    szobaAzon NUMBER GENERATED ALWAYS AS IDENTITY  START WITH 1 INCREMENT BY 1 primary key,
    nev varchar2(50),
    kreator varchar2(40)
);

create table kerdesSor(
    kerdesSorAzon NUMBER GENERATED ALWAYS AS IDENTITY  START WITH 1 INCREMENT BY 1 primary key,
    nev varchar2(40),
    nehezsegAzon number(38,0) references nehezseg(nehezsegAzon),
    osszpont number(38,0)
);

create table kerdesSorTemaja(
     temaAzon number(38,0) references tema( temaAzon ),
     kerdesSorAzon number(38,0) references kerdesSor (kerdesSorAzon),
     primary key(temaAzon,kerdesSorAzon)
);

create table kerdes(
    kerdesAzon NUMBER GENERATED ALWAYS AS IDENTITY  START WITH 1 INCREMENT BY 1 primary key,
    kerdesSorAzon number(38,0) references kerdesSor(kerdesSorAzon),
    nev varchar2(240),
    pontszam number(38,0)
);

create table felhasznalo(
    felhasznaloAzon NUMBER GENERATED ALWAYS AS IDENTITY  START WITH 1 INCREMENT BY 1 primary key,
    jelszo varchar2(30),
    email varchar2(30),
    szulDatum date,
    lakhelyAzon number(38,0) references lakhely (lakhelyAzon),
    felhasznaloNev varchar2(40)
);

create table kerdesValasza(
    valaszAzon number(38,0) references valasz(valaszAzon),
    kerdesAzon number(38,0) references kerdes(kerdesAzon),
    primary key(valaszAzon,kerdesAzon)
);

create table eredmeny(
    felhasznaloAzon number(38,0),
    kerdesSorAzon number (38,0),
    datum date,
    pontszam number(38,0),
    foreign key (kerdesSorAzon) references kerdes(kerdesAzon),
    foreign key (felhasznaloAzon) references felhasznalo(felhasznaloAzon)
);


create table felhasznaloSzobaja(
    szobaAzon number(38,0) references szoba(szobaAzon),
    felhasznaloAzon number(38,0) references felhasznalo(felhasznaloAzon),
    primary key(szobaAzon,felhasznaloAzon)
);

create table verseny(
    versenyAzon NUMBER GENERATED ALWAYS AS IDENTITY  START WITH 1 INCREMENT BY 1 primary key,
    temaAzon number(38,0) references tema(temaAzon),
    idopont date,
    kreator varchar2(40)
);

create table felhasznaloVersenye(
    felhasznaloAzon number(38,0) references felhasznalo(felhasznaloAzon),
    versenyAzon number(38,0) references verseny(versenyAzon),
    primary key (felhasznaloAzon,versenyAzon)
);

create table forumBejegyzes(
    bejegyzesAzon NUMBER GENERATED ALWAYS AS IDENTITY  START WITH 1 INCREMENT BY 1 primary key,
    szoveg varchar2(1500),
    felhasznaloAzon number(38,0) references felhasznalo(felhasznaloAzon)
);

create table bejegyzesTemaja(
     bejegyzesAzon number(38,0) references forumBejegyzes(bejegyzesAzon),
     temaAzon number(38,0) references tema(temaAzon),
     primary key (temaAzon,bejegyzesAzon)
);



delete from kerdesvalasza;
delete from eredmeny;
delete from felhasznaloszobaja;
delete from felhasznaloversenye;
delete from verseny;
delete from bejegyzestemaja;
delete from forumbejegyzes;
delete from kerdes;
delete from kerdesSorTemaja;
delete from kerdessor;
delete from szoba;
delete from nehezseg;
delete from valasz;
delete from felhasznalo;
delete from tema;
delete from lakhely ;

insert into lakhely (MEGYE, VAROS) values('Csongrad','Szeged');
insert into lakhely (MEGYE, VAROS) values('Csongrad','Dorozsma');
insert into lakhely (MEGYE, VAROS) values('Bacs-Kiskun','Kiskunhalas');
insert into lakhely (MEGYE, VAROS) values('Pest','Budapest');
insert into lakhely (MEGYE, VAROS) values('Bacs-Kiskun','Kecskemet');

    insert into tema (NEV) values('Matematika');
    insert into tema (NEV) values('Informatika');
    insert into tema (NEV) values('Termeszet Tudomanyok');
    insert into tema (NEV) values('Irodalom');
    insert into tema (NEV) values('Tortenelem');



    insert into valasz (NEV, HELYESSEG) values('x^2 / 2','Y');
    insert into valasz (NEV, HELYESSEG) values('1','N');
    insert into valasz (NEV, HELYESSEG) values('x^2','N');
    insert into valasz (NEV, HELYESSEG) values('1/2','N');
    insert into valasz (NEV, HELYESSEG) values('-cosx','Y');
    insert into valasz (NEV, HELYESSEG) values('cosx','N');
    insert into valasz (NEV, HELYESSEG) values('-sinx','N');
    insert into valasz (NEV, HELYESSEG) values('cotg','N');
    insert into valasz (NEV, HELYESSEG) values('x^3/3','N');
    insert into valasz (NEV, HELYESSEG) values('x','Y');
    insert into valasz (NEV, HELYESSEG) values('x+c','N');
    insert into valasz (NEV, HELYESSEG) values('x/2','N');
    insert into valasz (NEV, HELYESSEG) values('Halfaj','Y');
    insert into valasz (NEV, HELYESSEG) values('Madar','N');
    insert into valasz (NEV, HELYESSEG) values('Hullo','N');
    insert into valasz (NEV, HELYESSEG) values('Nem letezik ilyen allat','N');
    insert into valasz (NEV, HELYESSEG) values('Uj zeland','Y');
    insert into valasz (NEV, HELYESSEG) values('Oroszorszag','N');
    insert into valasz (NEV, HELYESSEG) values('Ausztralia','N');
    insert into valasz (NEV, HELYESSEG) values('Kina','N');
    insert into valasz (NEV, HELYESSEG) values('Inerciarendszerben minden test megtartja nyugalmi ï¿½llapotï¿½t vagy egyenes vonalï¿½ egyenletes mozgï¿½sï¿½t mindaddig, mï¿½g egy kï¿½lcsï¿½nhatï¿½s a mozgï¿½sï¿½llapotï¿½nak megvï¿½ltoztatï¿½sï¿½ra nem kï¿½nyszerï¿½ti. ','Y');
    insert into valasz (NEV, HELYESSEG) values('Egy test gyorsulï¿½sa egyenesen arï¿½nyos a rï¿½ hatï¿½ er?vel, ï¿½s fordï¿½tottan arï¿½nyos a test tï¿½megï¿½vel.','Y');
    insert into valasz (NEV, HELYESSEG) values('Az er?k mindig pï¿½rosï¿½val lï¿½pnek fel.','Y');
    insert into valasz (NEV, HELYESSEG) values('Az er?k mindig pï¿½rosï¿½val lï¿½pnek fel.','N');
    insert into valasz (NEV, HELYESSEG) values('Egy test gyorsulï¿½sa egyenesen arï¿½nyos a rï¿½ hatï¿½ er?vel, ï¿½s fordï¿½tottan arï¿½nyos a test tï¿½megï¿½vel.','N');
    insert into valasz (NEV, HELYESSEG) values('Ami egyszer felmegy, az le is esik','N');
    insert into valasz (NEV, HELYESSEG) values('Az hogy az almak leesnek a farol','N');
    insert into valasz (NEV, HELYESSEG) values('A feny gyorsan mozog... de nagyon','N');
    insert into valasz (NEV, HELYESSEG) values('I Szent Istvan','Y');
    insert into valasz (NEV, HELYESSEG) values('IV Bela','N');
    insert into valasz (NEV, HELYESSEG) values('Luxemburgi Zsigmond','N');
    insert into valasz (NEV, HELYESSEG) values('Geza fejedelem','N');
    insert into valasz (NEV, HELYESSEG) values('1541','Y');
    insert into valasz (NEV, HELYESSEG) values('1686','N');
    insert into valasz (NEV, HELYESSEG) values('1956','N');
    insert into valasz (NEV, HELYESSEG) values('1001','N');
    insert into valasz (NEV, HELYESSEG) values('III Andras','Y');
    insert into valasz (NEV, HELYESSEG) values('IV Kun Laszlo','N');
    insert into valasz (NEV, HELYESSEG) values('Arpad','N');
    insert into valasz (NEV, HELYESSEG) values('Karoly Robert','N');
    insert into valasz (NEV, HELYESSEG) values('1789','Y');
    insert into valasz (NEV, HELYESSEG) values('1799','N');
    insert into valasz (NEV, HELYESSEG) values('1848','N');
    insert into valasz (NEV, HELYESSEG) values('1756','N');

    insert into nehezseg (NEV) values('konnyu');
    insert into nehezseg (NEV) values('normal');
    insert into nehezseg (NEV) values('nehez');
    insert into nehezseg (NEV) values('nagyon nehez');
    insert into nehezseg (NEV) values('csontZene es patakVer');

    insert into szoba (NEV, KREATOR) values('Szoba tryhardereknek','BigChungus');
    insert into szoba (NEV, KREATOR) values('MatekRajonogok','Literally No one');
    insert into szoba (NEV, KREATOR) values('vasarnapi casual','esti Szel');
    insert into szoba (NEV, KREATOR) values('Generic Room','Generic Guy');
    insert into szoba (NEV, KREATOR) values('Szoba','Keszito');

    insert into kerdesSor (NEV, NEHEZSEGAZON, OSSZPONT) values('Kalk1 vizsga',4,100);
    insert into kerdesSor (NEV, NEHEZSEGAZON, OSSZPONT) values('Hazank elovilaga',2,100);
    insert into kerdesSor (NEV, NEHEZSEGAZON, OSSZPONT) values('Fizika 101',3,100);
    insert into kerdesSor (NEV, NEHEZSEGAZON, OSSZPONT) values('Tortenelem',1,100);

    insert into kerdes (KERDESSORAZON, NEV, PONTSZAM) values(1,'x integraltja',40);
    insert into kerdes (KERDESSORAZON, NEV, PONTSZAM) values(1,'sinx integraltja',40);
    insert into kerdes (KERDESSORAZON, NEV, PONTSZAM) values(1,'x^2 derivaltja?',20);
    insert into kerdes (KERDESSORAZON, NEV, PONTSZAM) values(2,'Milyen allat a "Tok" ? ',50);
    insert into kerdes (KERDESSORAZON, NEV, PONTSZAM) values(2,'Melyik orszag nemzeti allata a kiwi?',50);
    insert into kerdes (KERDESSORAZON, NEV, PONTSZAM) values(3,'Mi Newton 1. torvenye?',20);
    insert into kerdes (KERDESSORAZON, NEV, PONTSZAM) values(3,'Mi Newton 2. torvenye?',30);
    insert into kerdes (KERDESSORAZON, NEV, PONTSZAM) values(3,'Mi Newton 3. torvenye',50);
    insert into kerdes (KERDESSORAZON, NEV, PONTSZAM) values(4,'Ki alapitotta hazankat?',25);
    insert into kerdes (KERDESSORAZON, NEV, PONTSZAM) values(4,'Mikor esett el Buda a torokok altal?',25);
    insert into kerdes (KERDESSORAZON, NEV, PONTSZAM) values(4,'Ki volt az Arpad-haz utolso kiralya?',25);
    insert into kerdes (KERDESSORAZON, NEV, PONTSZAM) values(4,'Melyik evben kezdodott a Francia Forradalom?',25);
      -- insert into kerdes (KERDESSORAZON, NEV, PONTSZAM) values(2,'Galois kapcsolat',30);
   -- insert into kerdes (KERDESSORAZON, NEV, PONTSZAM) values(2,'DPll',30);
   -- insert into kerdes (KERDESSORAZON, NEV, PONTSZAM) values(2,'Elsorendu logika',40);

 insert into felhasznalo (JELSZO, EMAIL, SZULDATUM, LAKHELYAZON, FELHASZNALONEV) values('jelszo','nasa@citromail.hu',TO_DATE('13041982', 'ddmmyyyy'),1,'felhasznalonev');
    insert into felhasznalo (JELSZO, EMAIL, SZULDATUM, LAKHELYAZON, FELHASZNALONEV) values('jelszo','isEven@citromail.hu',TO_DATE('30122007', 'ddmmyyyy'),1,'fortnajtLuver69');
    insert into felhasznalo (JELSZO, EMAIL, SZULDATUM, LAKHELYAZON, FELHASZNALONEV) values('jelszo','sql@citromail.hu',TO_DATE('12032000', 'ddmmyyyy'),3,'justAguywithAchickenMask');
    insert into felhasznalo (JELSZO, EMAIL, SZULDATUM, LAKHELYAZON, FELHASZNALONEV) values('jelszo','nasa@citromail.hu',TO_DATE('13041982', 'ddmmyyyy'),1,'felhasznalonev');
    insert into felhasznalo (JELSZO, EMAIL, SZULDATUM, LAKHELYAZON, FELHASZNALONEV) values('jelszo','isEven@citromail.hu',TO_DATE('30122003', 'ddmmyyyy'),1,'gitGud');
    insert into felhasznalo (JELSZO, EMAIL, SZULDATUM, LAKHELYAZON, FELHASZNALONEV) values('jelszo','sql@citromail.hu',TO_DATE('12032002', 'ddmmyyyy'),3,'DeathblowIsAMyth');
    insert into felhasznalo (JELSZO, EMAIL, SZULDATUM, LAKHELYAZON, FELHASZNALONEV) values('jelszo','nasa@citromail.hu',TO_DATE('13041982', 'ddmmyyyy'),1,'DeneverSrac');
    insert into felhasznalo (JELSZO, EMAIL, SZULDATUM, LAKHELYAZON, FELHASZNALONEV) values('jelszo','isEven@citromail.hu',TO_DATE('30122001', 'ddmmyyyy'),1,'MagikusSuli');
    insert into felhasznalo (JELSZO, EMAIL, SZULDATUM, LAKHELYAZON, FELHASZNALONEV) values('jelszo','sql@citromail.hu',TO_DATE('12032001', 'ddmmyyyy'),3,'GolyoPokol');
    
     insert into felhasznalo (JELSZO, EMAIL, SZULDATUM, LAKHELYAZON, FELHASZNALONEV) values('jelszo','nasa@citromail.hu',TO_DATE('13041999', 'ddmmyyyy'),1,'Lancelot');
    insert into felhasznalo (JELSZO, EMAIL, SZULDATUM, LAKHELYAZON, FELHASZNALONEV) values('jelszo','isEven@citromail.hu',TO_DATE('30121970', 'ddmmyyyy'),1,'Mordred');
    insert into felhasznalo (JELSZO, EMAIL, SZULDATUM, LAKHELYAZON, FELHASZNALONEV) values('jelszo','sql@citromail.hu',TO_DATE('12032001', 'ddmmyyyy'),3,'Kain');
     insert into felhasznalo (JELSZO, EMAIL, SZULDATUM, LAKHELYAZON, FELHASZNALONEV) values('jelszo','sql@citromail.hu',TO_DATE('12032001', 'ddmmyyyy'),3,'DougDougW');
    
    insert into felhasznalo (JELSZO, EMAIL, SZULDATUM, LAKHELYAZON, FELHASZNALONEV) values('kitalalhatatlanjelszo1','nasa@citromail.hu',TO_DATE('13042000', 'ddmmyyyy'),1,'felhasznalonev');
    insert into felhasznalo (JELSZO, EMAIL, SZULDATUM, LAKHELYAZON, FELHASZNALONEV) values('jelszo2','isEven@citromail.hu',TO_DATE('30122001', 'ddmmyyyy'),1,'janosbatyjam');
    insert into felhasznalo (JELSZO, EMAIL, SZULDATUM, LAKHELYAZON, FELHASZNALONEV) values('jeslzo35','sql@citromail.hu',TO_DATE('12031997', 'ddmmyyyy'),3,'szeretemATejet');
    insert into felhasznalo (JELSZO, EMAIL, SZULDATUM, LAKHELYAZON, FELHASZNALONEV) values('innekEgyKavetMar','kettospont@citromail.hu',TO_DATE('10091999', 'ddmmyyyy'),5,'drop_database');

    insert into verseny (TEMAAZON, IDOPONT, KREATOR) values (1,TO_DATE('21102006', 'ddmmyyyy'),'Egy admin');
    insert into verseny  (TEMAAZON, IDOPONT, KREATOR) values (3,TO_DATE('21102012', 'ddmmyyyy'),'Egy masik admin');
    insert into verseny  (TEMAAZON, IDOPONT, KREATOR) values (5,TO_DATE('21102056', 'ddmmyyyy'),'Egy admin(a jovobol)');
    
    insert into forumBejegyzes (SZOVEG, FELHASZNALOAZON) values ('I hate derivatives. I hate hate hate them. Why would I ever have to find dy/dx of anything in terms of t? I wanna be a sociologist. Sure, why dont we implicitly differentiate the human race, because that makes sense. Maybe if I use the power rule instead, that will solve world hunger! What a waste of my time. I spend hours and hours and hours on this crap a week, just to have a C in the class. My only C. The end.Gah it feels good to get that outta my system. Fellow Calculus Comrades, how are you fairing?',3);
    insert into forumBejegyzes (SZOVEG, FELHASZNALOAZON) values ('Why is JavaScript so hated?
    JavaScript doesn’t have a class. Only objects. Inheritance is messed up. There are a lot of design faults that provide you with strange bugs in result.
    If you have a background in object oriented programming, JS is not what you expect to see. You have to really adapt to its quirks.
    It’s hard to read it. That’s why transpilers are constantly being used. Its level of complexity is really unneeded. At times, performing a simple task can be challenging because it doesn’t want to cooperate.
    There is no flexibility to use another language. Browser only runs JS, and won’t understand Python’s code for example. So, you can’t physically escape the sad fate. Frameworks definitely improved it though.
    JS gradually traps bugs in itself, attempting to cope with them. In the end, ends up disrupting everything and you can’t track the problem.',5);
    insert into forumBejegyzes (SZOVEG, FELHASZNALOAZON) values (' Imagine you are a construction worker, and your boss tells you to connect the gas pipe in the basement to the streets gas main. You go downstairs, and find that theres a glitch; this house doesnt have a basement. Perhaps you decide to do nothing, or perhaps you decide to whimsically interpret your instruction by attaching the gas main to some other nearby fixture, perhaps the neighbors air intake. Either way, suppose you report back to your boss that youre done.
KWABOOM! When the dust settles from the explosion, youd be guilty of criminal negligence.
Yet this is exactly what happens in many computer languages. In C/C++, the programmer (boss) can write "house"[-1] * 37. Its not clear what was intended, but clearly some mistake has been made. It would certainly be possible for the language (the worker) to report it, but what does C/C++ do?
    It finds some non-intuitive interpretation of "house"[-1] (one which may vary each time the program runs!, and which cant be predicted by the programmer),
    then it grabs a series of bits from some place dictated by the wacky interpretation,
    it blithely assumes that these bits are meant to be a number (not even a character),
    it multiplies that practically-random number by 37, and
    then reports the result, all without any hint of a problem.
',7);
insert into forumBejegyzes (SZOVEG, FELHASZNALOAZON) values('Im divorced, and want to poop myself in a livestream',13);
     insert into forumBejegyzes (SZOVEG, FELHASZNALOAZON) values ('Once upon a time in a kingdom far,far away, the king and queen wereblessed with a beautiful baby girl.And throughout the land, everyonewas happy... until the sun went downand they saw that their daughter wascursed with a frightful enchantmentthat took hold each and every night.Desperate, they sought the help of afairy godmother who had them lockthe young princess away in a tower,there to await the kiss... of thehandsome Prince Charming.(enters gallantly onstage)It was he who would chance theperilous journey through blisteringcold and scorching desert travelingfor many days and nights, riskinglife and limb to reach the Dragon skeep. For he was the bravest, andmost handsome... in all the land.(looks at the audience)And it was destiny that his kisswould break the dreaded curse. Healone would climb to the highestroom of the tallest tower to enterthe princesss chambers, cross theroom to her silhouette,pull back the curtains tofind her(pulls back the curtain toreveal WOLF in the bed.Gasps)',3);
     insert into forumBejegyzes (SZOVEG, FELHASZNALOAZON) values('Komolyan eladnam a lelkem hogy atmenjek bonyabol...',6);
     insert into forumBejegyzes (SZOVEG, FELHASZNALOAZON) values('Megis mijota nem Geza fejedelem alapitottamagyarorszagot!?.!! Confused',11);

insert all
    into kerdesvalasza values(1,1)
    into kerdesvalasza values(2,1)
    into kerdesvalasza values(3,1)
    into kerdesvalasza values(4,1)
    into kerdesvalasza values(5,2)
    into kerdesvalasza values(6,2)
    into kerdesvalasza values(7,2)
    into kerdesvalasza values(8,2)
    into kerdesvalasza values(9,3)
    into kerdesvalasza values(10,3)
    into kerdesvalasza values(11,3)
    into kerdesvalasza values(12,3)
    into kerdesvalasza values(13,4)
    into kerdesvalasza values(14,4)
    into kerdesvalasza values(15,4)
    into kerdesvalasza values(16,4)
    into kerdesvalasza values(17,5)
    into kerdesvalasza values(18,5)
    into kerdesvalasza values(19,5)
    into kerdesvalasza values(20,5)
    into kerdesvalasza values(21,6)
    into kerdesvalasza values(26,6)
    into kerdesvalasza values(24,6)
    into kerdesvalasza values(25,6)
    into kerdesvalasza values(22,7)
    into kerdesvalasza values(24,7)
    into kerdesvalasza values(26,7)
    into kerdesvalasza values(28,7)
    into kerdesvalasza values(23,8)
    into kerdesvalasza values(26,8)
    into kerdesvalasza values(27,8)
    into kerdesvalasza values(28,8)
    into kerdesvalasza values(29,9)
    into kerdesvalasza values(30,9)
    into kerdesvalasza values(31,9)
    into kerdesvalasza values(32,9)
    into kerdesvalasza values(33,10)
    into kerdesvalasza values(34,10)
    into kerdesvalasza values(35,10)
    into kerdesvalasza values(36,10)
    into kerdesvalasza values(37,11)
    into kerdesvalasza values(38,11)
    into kerdesvalasza values(39,11)
    into kerdesvalasza values(40,11)
    into kerdesvalasza values(41,12)
    into kerdesvalasza values(42,12)
    into kerdesvalasza values(43,12)
    into kerdesvalasza values(44,12)


select 1 from dual;

insert all
    into eredmeny values (1,3,TO_DATE('12032022', 'ddmmyyyy'),50)
    into eredmeny values (1,5,TO_DATE('12032021', 'ddmmyyyy'),50)
    into eredmeny values (1,5,TO_DATE('12032022', 'ddmmyyyy'),75)
    into eredmeny values (2,5,TO_DATE('22032012', 'ddmmyyyy'),100)
    into eredmeny values (2,4,TO_DATE('22032012', 'ddmmyyyy'),80)
    into eredmeny values (2,1,TO_DATE('22032012', 'ddmmyyyy'),40)
    into eredmeny values (3,3,TO_DATE('22032012', 'ddmmyyyy'),100)
    into eredmeny values (3,1,TO_DATE('22032012', 'ddmmyyyy'),60)
    into eredmeny values (4,1,TO_DATE('22032020', 'ddmmyyyy'),40)
    into eredmeny values (4,3,TO_DATE('22032021', 'ddmmyyyy'),100)
    into eredmeny values (4,4,TO_DATE('22032021', 'ddmmyyyy'),50)
    into eredmeny values (4,5,TO_DATE('22032012', 'ddmmyyyy'),100)
     into eredmeny values (5,3,TO_DATE('12032022', 'ddmmyyyy'),50)
    into eredmeny values (5,5,TO_DATE('12032021', 'ddmmyyyy'),50)
    into eredmeny values (6,5,TO_DATE('12032022', 'ddmmyyyy'),75)
    into eredmeny values (6,5,TO_DATE('22032012', 'ddmmyyyy'),100)
    into eredmeny values (6,4,TO_DATE('22032012', 'ddmmyyyy'),30)
    into eredmeny values (7,1,TO_DATE('22032012', 'ddmmyyyy'),40)
    into eredmeny values (7,3,TO_DATE('22032012', 'ddmmyyyy'),0)
     into eredmeny values (5,5,TO_DATE('12032021', 'ddmmyyyy'),100)
    into eredmeny values (6,5,TO_DATE('12032022', 'ddmmyyyy'),0)
    into eredmeny values (6,5,TO_DATE('22032012', 'ddmmyyyy'),75)
    into eredmeny values (6,4,TO_DATE('22032012', 'ddmmyyyy'),60)
    into eredmeny values (7,1,TO_DATE('22032012', 'ddmmyyyy'),20)
    into eredmeny values (7,3,TO_DATE('22032012', 'ddmmyyyy'),0)
    into eredmeny values (7,1,TO_DATE('22032012', 'ddmmyyyy'),20)
    into eredmeny values (7,1,TO_DATE('22032020', 'ddmmyyyy'),60)
    into eredmeny values (8,3,TO_DATE('22032021', 'ddmmyyyy'),0)
    into eredmeny values (8,4,TO_DATE('22032021', 'ddmmyyyy'),70)
    into eredmeny values (8,5,TO_DATE('22032012', 'ddmmyyyy'),25)
     into eredmeny values (8,3,TO_DATE('12032022', 'ddmmyyyy'),40)
    into eredmeny values (8,5,TO_DATE('12032021', 'ddmmyyyy'),50)
    into eredmeny values (9,5,TO_DATE('12032022', 'ddmmyyyy'),75)
    into eredmeny values (9,5,TO_DATE('22032012', 'ddmmyyyy'),100)
    into eredmeny values (9,4,TO_DATE('22032012', 'ddmmyyyy'),50)
    into eredmeny values (9,1,TO_DATE('22032012', 'ddmmyyyy'),40)
    into eredmeny values (9,3,TO_DATE('22032012', 'ddmmyyyy'),60)
    into eredmeny values (9,1,TO_DATE('22032012', 'ddmmyyyy'),20)
    into eredmeny values (10,1,TO_DATE('22032020', 'ddmmyyyy'),60)
    into eredmeny values (10,3,TO_DATE('22032021', 'ddmmyyyy'),100)
    into eredmeny values (10,4,TO_DATE('22032021', 'ddmmyyyy'),50)
    into eredmeny values (10,5,TO_DATE('22032012', 'ddmmyyyy'),100)
        into eredmeny values (11,1,TO_DATE('22032020', 'ddmmyyyy'),20)
    into eredmeny values (11,3,TO_DATE('22032021', 'ddmmyyyy'),0)
    into eredmeny values (11,4,TO_DATE('22032021', 'ddmmyyyy'),80)
    into eredmeny values (11,5,TO_DATE('22032012', 'ddmmyyyy'),75)
        into eredmeny values (12,1,TO_DATE('22032020', 'ddmmyyyy'),40)
    into eredmeny values (12,3,TO_DATE('22032021', 'ddmmyyyy'),100)
    into eredmeny values (13,4,TO_DATE('22032021', 'ddmmyyyy'),70)
    into eredmeny values (13,5,TO_DATE('22032012', 'ddmmyyyy'),50)
        into eredmeny values (13,1,TO_DATE('22032020', 'ddmmyyyy'),40)
    into eredmeny values (13,3,TO_DATE('22032021', 'ddmmyyyy'),20)
    into eredmeny values (13,4,TO_DATE('22032021', 'ddmmyyyy'),80)
    into eredmeny values (14,5,TO_DATE('22032012', 'ddmmyyyy'),75)
     into eredmeny values (13,3,TO_DATE('22032021', 'ddmmyyyy'),50)
    into eredmeny values (13,4,TO_DATE('22032021', 'ddmmyyyy'),80)
    into eredmeny values (14,5,TO_DATE('22032012', 'ddmmyyyy'),100)
    into eredmeny values (14,1,TO_DATE('22032012', 'ddmmyyyy'),40)
    into eredmeny values (14,1,TO_DATE('22032012', 'ddmmyyyy'),20)
    into eredmeny values (14,5,TO_DATE('22032012', 'ddmmyyyy'),75)
    into eredmeny values (14,5,TO_DATE('22032012', 'ddmmyyyy'),75)
    into eredmeny values (14,5,TO_DATE('22032012', 'ddmmyyyy'),75)
    into eredmeny values (15,1,TO_DATE('22032012', 'ddmmyyyy'),0)
    into eredmeny values (15,1,TO_DATE('22032012', 'ddmmyyyy'),0)
    into eredmeny values (15,1,TO_DATE('22032012', 'ddmmyyyy'),20)
    into eredmeny values (15,1,TO_DATE('22032012', 'ddmmyyyy'),20)
    into eredmeny values (15,1,TO_DATE('22032012', 'ddmmyyyy'),40)
    into eredmeny values (15,1,TO_DATE('22032012', 'ddmmyyyy'),40)
    into eredmeny values (15,1,TO_DATE('22032012', 'ddmmyyyy'),60)
    into eredmeny values (15,5,TO_DATE('22032012', 'ddmmyyyy'),100)
    into eredmeny values (15,5,TO_DATE('22032012', 'ddmmyyyy'),100)
    into eredmeny values (15,4,TO_DATE('22032012', 'ddmmyyyy'),90)
    into eredmeny values (15,4,TO_DATE('22032012', 'ddmmyyyy'),60)
    into eredmeny values (15,2,TO_DATE('22032012', 'ddmmyyyy'),30)
    
    
    
select 1 from dual;

insert all
    into felhasznaloszobaja values (1,2)
    into felhasznaloszobaja values (5,1)
    into felhasznaloszobaja values (4,3)
    into felhasznaloszobaja values (3,2)
    into felhasznaloszobaja values (2,3)
select 1 from dual;

insert all
    into felhasznaloversenye values(1,1)
    into felhasznaloversenye values(1,2)
    into felhasznaloversenye values(2,1)
    into felhasznaloversenye values(2,2)
    into felhasznaloversenye values(2,3)
    into felhasznaloversenye values(3,2)
    into felhasznaloversenye values(3,1)
select 1 from dual;

insert all
    into bejegyzestemaja values(1,1)
    into bejegyzestemaja values(2,2)
    into bejegyzestemaja values(3,2)
    into bejegyzestemaja values(4,4)
    into bejegyzestemaja values(5,2)
    into bejegyzestemaja values(6,5)
    into bejegyzestemaja values(7,5)
select 1 from dual;

insert all
    into kerdessortemaja values (1,1)
    into kerdessortemaja values (3,2)
    into kerdessortemaja values (3,3)
    into kerdessortemaja values (5,4)
select 1 from dual;

drop table logon;
create table logon( nev varchar2(30), datum date);
drop table felhasznaloLog;
create table felhasznaloLog (datum date, szoveg varchar2(300));

--logolja a Userek adatainak valtozasat
create or replace trigger userLog
after insert or update or delete
on felhasznalo
for each row
declare
    seged_azon felhasznalo.felhasznaloAzon%type;
    seged_jelszo felhasznalo.jelszo%type;
    seged_email varchar2(40);
    seged_szuldatum date;
    seged_lakhely felhasznalo.lakhelyAzon%type;
    seged_nev felhasznalo.felhasznaloNev%type;
    cselekves varchar(120);
    valtozas varchar2(100);
begin
    if inserting then
    cselekves := 'Added';
    seged_azon  := :new.felhasznaloAzon;
    seged_jelszo  := :new.jelszo;
    seged_email  := :new.email;
    seged_szuldatum  := :new.szuldatum;
    seged_lakhely  := :new.lakhelyAzon;
    seged_nev  := :new.felhasznaloNev;
    valtozas := 'uj felhasznalo kerult be';
    elsif updating then
    cselekves := 'updated';
    seged_azon := :new.felhasznaloAzon;
    valtozas := 'Frissitettek az adatait ';
    IF NVL(:OLD.felhasznaloAzon, null) != NVL(:NEW.felhasznaloAzon, null) THEN
             valtozas := valtozas || 'Azonosito';
        END IF;
        IF NVL(:OLD.jelszo, '-null-') != NVL(:NEW.jelszo, '-null-') THEN
             valtozas := valtozas || 'jelszo: ' || :OLD.jelszo || '->'|| :NEW.jelszo;
        END IF;
        IF NVL(:OLD.email, '-null-') != NVL(:NEW.email, '-null-') THEN
             valtozas := valtozas || 'email: ' || :OLD.email || '->'|| :NEW.email;
        END IF;
        IF NVL(:OLD.szuldatum, null) != NVL(:NEW.szuldatum, null) THEN
             valtozas := valtozas || 'szuldatum: ' || :OLD.szuldatum || '->'|| :NEW.szuldatum;
        END IF;
        IF NVL(:OLD.lakhelyAzon, null) != NVL(:NEW.lakhelyAzon, null) THEN
             valtozas := valtozas || 'lakhelyAzon: ' || :OLD.lakhelyAzon || '->'|| :NEW.lakhelyAzon;
        END IF;
        IF NVL(:OLD.felhasznaloNev, '-null-') != NVL(:NEW.felhasznaloNev, '-null-') THEN
             valtozas := valtozas || 'felhasznaloNev: ' || :OLD.felhasznaloNev || '->'|| :NEW.felhasznaloNev;
        END IF;
        elsif deleting then
        cselekves := 'toroltuk';
        seged_azon  := :old.felhasznaloAzon;
        valtozas := '';
        end if;
         cselekves := cselekves || ' felhasznalonk '|| seged_nev ||' ' ||valtozas;
        insert into felhasznaloLog values(sysdate, cselekves); 
       end;
  /

CREATE OR REPLACE TRIGGER On_Logon
AFTER LOGON ON Schema 
BEGIN
         INSERT INTO LOGON VALUES (USER || ' belepett', SYSDATE);
END;
/

CREATE OR REPLACE TRIGGER On_Logoff
BEFORE LOGOFF
ON Schema
BEGIN
     INSERT INTO LOGON VALUES (USER || ' kilepett', SYSDATE);
END;
/


create or replace trigger NeTorold
before drop on schema
begin
if(ORA_DICT_OBJ_NAME = 'EREDMENYEK') then
        RAISE_APPLICATION_ERROR(-20021,'Leglabb 40 percig parositgattam az ID-ket, mert elszamoltam magam, szoval nem hagyom hogy torold.');
    end if;
end;
/

--Kiirja hany rekordot tartalmaz az adatbazis
create or replace procedure dataCounts
is 
suNev varchar2(3000);
sumsam number;
tabsam varchar2(230);
cursor sumCount is 
select sum(to_number(
    extractvalue(
      xmltype(
         dbms_xmlgen.getxml(
         'select count(*) c from '||table_name))
    ,'/ROWSET/ROW/C')) ), table_name
from 
   user_tables
   group by table_name;
   
begin
select sum(nev) into suNev from(
select sum(to_number(
    extractvalue(
      xmltype(
         dbms_xmlgen.getxml(
         'select count(*) c from '||table_name))
    ,'/ROWSET/ROW/C')) )nev
from 
   user_tables
   group by table_name);
   
DBMS_OUTPUT.PUT_LINE('Az osszes rekord szama az adatbazisban: '||suNev);
open sumCount;
loop
 fetch sumCount
 into sumsam, tabsam;
 exit when sumCount%notfound;
 DBMS_OUTPUT.PUT_LINE('A ' || tabsam || 'tablaban: '||sumsam|| ' rekord van');
end loop;
end;
/

--Kitorli az osszes log tablabol azokat az entryket amik regebbiek a megadott datumnal
create or replace procedure logCleanUp(Ezelotti date)
is 
var_jelszo varchar2(30);
begin
delete from felhasznaloLog where datum<Ezelotti;
delete from logon where datum<Ezelotti;
DBMS_OUTPUT.PUT_LINE('Toroltuk a megadottnal ('||Ezelotti||') regebbi log fajlokat');
exception
when no_data_found then
dbms_output.put_line('nincs adat??');
end;
/

create or replace procedure pwChange(felhasznaloID in varchar2, newPW in varchar2)
is 
var_jelszo varchar2(30);
begin
select jelszo into var_jelszo from felhasznalo where felhasznaloAzon = felhasznaloID ;
update felhasznalo set jelszo=newPW where felhasznaloAzon = felhasznaloID;
DBMS_OUTPUT.PUT_LINE('A '||felhasznaloID||' azonositoju felhasznalo uj jelszava: '||newPW);
exception
when no_data_found then
dbms_output.put_line('Nincs ilyen azonositoval ellatott felhasznalo!');
end;
/

--torli a vulgaris szavakat tartalmazo postokat
create or replace procedure autoMod
is 
cursor bejegyzesek is select szoveg from forumbejegyzes;
var_szoveg varchar2(3000);
begin
open bejegyzesek;

loop
fetch bejegyzesek into var_szoveg;
exit when bejegyzesek%notfound;
if(var_szoveg like '%fuck%' or  var_szoveg like '%shit%') then
delete from forumbejegyzes where szoveg = var_szoveg;
end if;
end loop;
close bejegyzesek;
dbms_output.put_line('Torlodtek a tragar bejegyzesek!');
exception
when no_data_found then
dbms_output.put_line('nincs adat??');
end;
/


