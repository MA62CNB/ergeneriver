package 
{
    import GameL.*;
    import caurina.transitions.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.ui.*;
    import flash.utils.*;

    public class GameL extends Sprite
    {
        var sfxChannel:SoundChannel;
        var bgmChannel:SoundChannel;
        var bgmLoopChannel:SoundChannel;
        var playerMove:cocuk_hareket;
        var rightChoice:dogru_nesne;
        var introMusic:giris_icin_tam_muzik;
        var bgmLoop:oyun_ici_loop_muzik;
        var sfxVarious:secimler;
        var success:tebrikler;
        var success2:tebrikler2;
        var wrongChoice:yanlis_nesne;
        const MAIN_VOLUME:Number = 0.7;
        const INGAME_VOLUME:Number = 0.2;
        var soundStr:String;
        var sndTrans:SoundTransform;
        var bgmMute:Boolean = false;
        const ZERO:int = 3;
        var htpScreen:MainHelp;
        var ingameHelp:GameInfomc;
        var titleBg:Harita;
        var yildiz1:Yildiz1;
        var yildiz2:Yildiz2;
        var yildiz3:Yildiz3;
        var yildizSon:Finale;
        var randomPoint:RandomPlus;
        var randomPoint2:RandomPlus;
        var toplam:Array;
        var char:int = -1;
        var currentRoadLine:int = 3;
        var index1:int = 0;
        var index2:int = 0;
        var index3:int = 0;
        var info:Info;
        var cont1:MovieClip;
        var cont2:MovieClip;
        var cont3:MovieClip;
        var cont4:MovieClip;
        var nehirBg:Blm1;
        var bolumNo:BolumNo;
        var kopruImg:Kopru;
        var yesil:Yesil;
        var sari:Sari;
        var pembe:Pembe;
        var bot:Bot;
        var deter:Deter;
        var bidon:Bidon;
        var kutu:Kutu;
        var lastik:Lastik;
        var cips:Cips;
        var pet:Pet;
        var konserve:Konserve;
        var balik:Balik;
        var ordek:Ordek;
        var kurbaga:Kurbaga;
        var oyuncu:MovieClip;
        var canImg:Health;
        var point:Points;
        var itemSpeed:Object;
        var score:Object;
        var lives:Object;
        var levelNo:Object;
        var completed:int;
        var endInterval:Timer;
        var interval2:Timer;
        var allLives:int = 4;
        var animalArray:Array;
        var trashArray:Array;
        var pos1:Array;
        var posArray:Array;
        var pos3:Array;
        var posYs:Array;
        var finalBg:Kirli;
        var pops:Pops;
        var oyunSonu:OyunSon;
        var gunes:Sun;
        var copler:Copler;
        var pompa:Pompa;
        var trak1:Traktor;
        var trak2:Traktor;
        var trak3:Traktor;
        var trak4:Traktor;
        var panel:Panel;
        var ormanAlan:OrmanAlan;
        var bacaAlan:BacaAlan;
        var turbinAlan:TurbinAlan;
        var aritmaAlan:AritmaAlan;
        var bacaIcon:baca_ikon;
        var ormanIcon:camlar_ikon;
        var turbinIcon:turbin_ikon;
        var aritmaIcon:aritma_ikon;
        var pompaIcon:pompa_ikon;
        var trkatorIcon:traktor_ikon;
        var coplerIcon:copler_ikon;
        var trackIndex:int;
        var counter:int = 0;
        var traktorCounter:int = 0;
        var aritmaFlag:Boolean = false;
        var how:HowPlay;
        var howLast:HowLast;
        var restart_bg:Restart;
        var restart_btn:RButton;
        var nextBg:Interscreen;
        var nextBtn:Next;
        var once:Boolean = true;

        public function GameL()
        {
            this.sfxChannel = new SoundChannel();
            this.bgmChannel = new SoundChannel();
            this.bgmLoopChannel = new SoundChannel();
            this.playerMove = new cocuk_hareket();
            this.rightChoice = new dogru_nesne();
            this.introMusic = new giris_icin_tam_muzik();
            this.bgmLoop = new oyun_ici_loop_muzik();
            this.sfxVarious = new secimler();
            this.success = new tebrikler();
            this.success2 = new tebrikler2();
            this.wrongChoice = new yanlis_nesne();
            this.sndTrans = new SoundTransform();
            this.htpScreen = new MainHelp();
            this.ingameHelp = new GameInfomc();
            this.titleBg = new Harita();
            this.yildiz1 = new Yildiz1();
            this.yildiz2 = new Yildiz2();
            this.yildiz3 = new Yildiz3();
            this.yildizSon = new Finale();
            this.randomPoint = new RandomPlus(0, 3);
            this.randomPoint2 = new RandomPlus(0, 2);
            this.toplam = new Array();
            this.info = new Info();
            this.nehirBg = new Blm1();
            this.bolumNo = new BolumNo();
            this.kopruImg = new Kopru();
            this.yesil = new Yesil();
            this.sari = new Sari();
            this.pembe = new Pembe();
            this.bot = new Bot();
            this.deter = new Deter();
            this.bidon = new Bidon();
            this.kutu = new Kutu();
            this.lastik = new Lastik();
            this.cips = new Cips();
            this.pet = new Pet();
            this.konserve = new Konserve();
            this.balik = new Balik();
            this.ordek = new Ordek();
            this.kurbaga = new Kurbaga();
            this.oyuncu = new MovieClip();
            this.canImg = new Health();
            this.point = new Points();
            this.endInterval = new Timer(500, 1);
            this.interval2 = new Timer(250, 1);
            this.trashArray = new Array();
            this.pos1 = [395, 595, 795];
            this.posArray = [296, 496, 696, 896];
            this.pos3 = [300, 400, 500, 600, 700, 800, 900];
            this.posYs = [-110, -210, -310];
            this.copler = new Copler();
            this.pompa = new Pompa();
            this.trak1 = new Traktor();
            this.trak2 = new Traktor();
            this.trak3 = new Traktor();
            this.trak4 = new Traktor();
            this.ormanAlan = new OrmanAlan();
            this.bacaAlan = new BacaAlan();
            this.turbinAlan = new TurbinAlan();
            this.aritmaAlan = new AritmaAlan();
            this.bacaIcon = new baca_ikon();
            this.ormanIcon = new camlar_ikon();
            this.turbinIcon = new turbin_ikon();
            this.aritmaIcon = new aritma_ikon();
            this.pompaIcon = new pompa_ikon();
            this.trkatorIcon = new traktor_ikon();
            this.coplerIcon = new copler_ikon();
            this.how = new HowPlay();
            this.howLast = new HowLast();
            this.restart_bg = new Restart();
            this.restart_btn = new RButton();
            this.nextBg = new Interscreen();
            this.nextBtn = new Next();
            this.init(0);
            this.levelNo = 1;
            this.completed = 0;
            return;
        }// end function

        private function init(addChild:int) : void
        {
            switch(addChild)
            {
                case 0:
                {
                    this.InitLobi();
                    break;
                }
                case 1:
                {
                    this.completed = 0;
                    this.levelNo = 1;
                    this.itemSpeed = 12;
                    this.score = 0;
                    this.nehirBg.kirlinehirmc.alpha = 0.5;
                    this.point.texts.text = "0";
                    this.lives = 3;
                    this.canImg.gotoAndStop(1);
                    break;
                }
                case 2:
                {
                    this.currentRoadLine = this.ZERO;
                    this.itemSpeed = 15;
                    this.score = 0;
                    this.nehirBg.kirlinehirmc.alpha = 0.5;
                    this.point.texts.text = "0";
                    this.lives = 3;
                    this.canImg.gotoAndStop(1);
                    break;
                }
                case 3:
                {
                    this.currentRoadLine = this.ZERO;
                    this.itemSpeed = 16;
                    this.score = 0;
                    this.nehirBg.kirlinehirmc.alpha = 0.5;
                    this.point.texts.text = "0";
                    this.lives = 3;
                    this.canImg.gotoAndStop(1);
                    break;
                }
                case 4:
                {
                    this.BeginLast();
                    break;
                }
                case -1:
                {
                    addChild(this.restart_bg);
                    this.restart_bg.cacheAsBitmap = true;
                    addChild(this.restart_btn);
                    this.restart_bg.x = 0;
                    this.restart_bg.y = 0;
                    this.restart_btn.x = 352.5;
                    this.restart_btn.y = 512.5;
                    this.restart_btn.addEventListener(MouseEvent.CLICK, this.DoRestart, false, 0, true);
                    this.restart_btn.buttonMode = true;
                    this.canImg.gotoAndStop(4);
                    this.score = 0;
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        private function InitLobi()
        {
            this.sndTrans.volume = this.MAIN_VOLUME;
            addChild(this.titleBg);
            if (this.bgmMute == false)
            {
                this.titleBg.ses_kontrol.gotoAndStop(1);
                SoundMixer.stopAll();
                this.bgmLoopChannel.stop();
                this.bgmChannel.stop();
                this.bgmChannel = this.introMusic.play(0, 1, this.sndTrans);
                this.bgmChannel.addEventListener(Event.SOUND_COMPLETE, this.IsSoundFinished);
            }
            else
            {
                this.titleBg.ses_kontrol.gotoAndStop(2);
                this.bgmMute = false;
            }
            this.titleBg.ses_kontrol.buttonMode = true;
            this.titleBg.ses_kontrol.addEventListener(MouseEvent.CLICK, this.BgmControl);
            this.soundStr = "introMusic";
            this.titleBg.cacheAsBitmap = true;
            this.titleBg.helpb.addEventListener(MouseEvent.CLICK, this.DisplayHtp);
            this.titleBg.helpb.buttonMode = true;
            this.titleBg.y2mc.visible = true;
            this.titleBg.y3mc.visible = true;
            this.titleBg.y4mc.visible = true;
            addChild(this.yildiz1);
            addChild(this.yildiz2);
            addChild(this.yildiz3);
            addChild(this.yildizSon);
            this.yildiz2.visible = false;
            this.yildiz3.visible = false;
            this.yildizSon.visible = false;
            this.yildiz1.addEventListener(MouseEvent.CLICK, this.FirstStage);
            this.yildiz1.buttonMode = true;
            this.YildizLoaderHandler();
            this.titleBg.x = 0;
            this.titleBg.y = 0;
            this.yildiz1.x = 215.8;
            this.yildiz1.y = 158.9;
            this.yildiz2.x = 132.45;
            this.yildiz2.y = 411.5;
            this.yildiz3.x = 463.25;
            this.yildiz3.y = 282.6;
            this.yildizSon.x = 734.55;
            this.yildizSon.y = 199.6;
            return;
        }// end function

        private function InitMain()
        {
            var _loc_3:uint = 0;
            var _loc_4:uint = 0;
            var _loc_5:uint = 0;
            var _loc_6:OyunK = null;
            var _loc_7:OyunE = null;
            this.sndTrans.volume = this.INGAME_VOLUME;
            this.cont1 = new MovieClip();
            this.cont2 = new MovieClip();
            this.cont3 = new MovieClip();
            this.cont1.addChild(this.nehirBg);
            this.cont1.addChild(this.bolumNo);
            this.cont1.addChild(this.canImg);
            this.cont1.addChild(this.point);
            if (this.bgmMute == false)
            {
                this.point.ses_cont.gotoAndStop(1);
                this.bgmChannel.stop();
                this.bgmLoopChannel.stop();
                this.bgmLoopChannel = this.bgmLoop.play(0, 1, this.sndTrans);
                this.bgmLoopChannel.addEventListener(Event.SOUND_COMPLETE, this.IsSoundFinished);
            }
            else
            {
                this.point.ses_cont.gotoAndStop(2);
                this.bgmMute = false;
            }
            this.point.ses_cont.buttonMode = true;
            this.point.ses_cont.addEventListener(MouseEvent.CLICK, this.BgmControl);
            this.soundStr = "bgmLoop";
            this.endInterval.addEventListener(TimerEvent.TIMER_COMPLETE, this.IntervalHandler);
            this.nehirBg.cacheAsBitmap = true;
            this.bolumNo.cacheAsBitmap = true;
            this.canImg.cacheAsBitmap = true;
            this.point.cacheAsBitmap = true;
            addEventListener(Event.ENTER_FRAME, this.MainScenes);
            stage.addEventListener(KeyboardEvent.KEY_DOWN, this.KeyMoves);
            this.point.play_b.addEventListener(MouseEvent.CLICK, this.PauseGame);
            this.point.lobi_b.addEventListener(MouseEvent.CLICK, this.GoLobi);
            this.point.yardim_b.addEventListener(MouseEvent.CLICK, this.ShowIngameHelp);
            this.point.play_b.buttonMode = true;
            this.point.lobi_b.buttonMode = true;
            this.point.yardim_b.buttonMode = true;
            this.animalArray = [this.balik, this.kurbaga, this.ordek];
            this.trashArray = [this.bidon, this.bot, this.cips, this.deter, this.konserve, this.kutu, this.lastik, this.pet, this.pembe, this.sari, this.yesil];
            var _loc_1:uint = 0;
            while (_loc_1++ < 3)
            {
                
                this.animalArray[_loc_1].x = this.posArray[this.randomPoint.getNum()];
                this.animalArray[_loc_1].y = this.posYs[this.randomPoint2.getNum()];
                addChild(this.cont1);
                this.cont1.addChild(this.animalArray[_loc_1]);
            }
            var _loc_2:uint = 0;
            while (_loc_2++ < 11)
            {
                
                this.trashArray[_loc_2].x = this.pos1[this.randomPoint2.getNum()];
                this.trashArray[_loc_2].y = -150;
                addChild(this.cont2);
                this.cont2.addChild(this.trashArray[_loc_2]);
            }
            addChild(this.cont3);
            this.cont3.addChild(this.kopruImg);
            if (this.levelNo == 1)
            {
                _loc_3 = 0;
                while (_loc_3++ < 11)
                {
                    
                    this.toplam[_loc_3] = 1;
                }
            }
            if (this.levelNo == 2)
            {
                _loc_4 = 0;
                while (_loc_4++ < 11)
                {
                    
                    this.toplam[_loc_4] = 1;
                }
            }
            if (this.levelNo == 3)
            {
                _loc_5 = 0;
                while (_loc_5++ < 11)
                {
                    
                    this.toplam[_loc_5] = 1;
                }
            }
            if (this.char == 1)
            {
                _loc_6 = new OyunK();
                this.oyuncu = _loc_6;
            }
            if (this.char == 0)
            {
                _loc_7 = new OyunE();
                this.oyuncu = _loc_7;
            }
            this.oyuncu.cacheAsBitmap = true;
            this.nehirBg.x = 0;
            this.nehirBg.y = 0;
            this.kopruImg.y = 588;
            this.bolumNo.x = 43.2;
            this.bolumNo.y = 22.8;
            this.oyuncu.x = 600;
            this.oyuncu.y = 450;
            this.cont3.addChild(this.oyuncu);
            this.canImg.x = 55.9;
            this.canImg.y = 134;
            this.point.x = stage.stageWidth - (this.point.width + this.point.width / 8);
            this.point.y = 25;
            this.addEventListener(Event.ENTER_FRAME, this.MainScenes, false, 0, true);
            return;
        }// end function

        private function MainScenes(event:Event)
        {
            this.bolumNo.blm_num.text = String(this.levelNo);
            stage.addEventListener(KeyboardEvent.KEY_DOWN, this.KeyMoves);
            var _loc_2:uint = 0;
            while (_loc_2++ < this.toplam.length)
            {
                
                if (this.toplam[_loc_2] < 0)
                {
                    this.toplam[_loc_2] = 0;
                }
            }
            this.point.txt0.text = String(this.toplam[0]);
            this.point.txt1.text = String(this.toplam[1]);
            this.point.txt2.text = String(this.toplam[2]);
            this.point.txt3.text = String(this.toplam[3]);
            this.point.txt4.text = String(this.toplam[4]);
            this.point.txt5.text = String(this.toplam[5]);
            this.point.txt6.text = String(this.toplam[6]);
            this.point.txt7.text = String(this.toplam[7]);
            this.point.txt8.text = String(this.toplam[8] + this.toplam[9] + this.toplam[10]);
            if (!this.Puanlama(this.toplam))
            {
                if (this.oyuncu.x <= this.pos3[0])
                {
                    this.oyuncu.x = this.pos3[0];
                }
                else if (this.oyuncu.x >= this.pos3[this.pos3.length--])
                {
                    this.oyuncu.x = this.pos3[this.pos3.length--];
                }
                if (this.animalArray != null)
                {
                    if (this.animalArray[0].y > stage.stageHeight)
                    {
                        this.animalArray[0].x = this.posArray[this.randomPoint.getNum()];
                        this.animalArray[0].y = -150;
                        var _loc_3:String = this;
                        _loc_3.index1 = this.index1++;
                    }
                    else
                    {
                        if (this.animalArray[0].hitTestObject(this.oyuncu.suzgec_alan_MC))
                        {
                            var _loc_3:String = this;
                            _loc_3.lives = this.lives--;
                            this.nehirBg.nega.gotoAndPlay(2);
                            this.canImg.gotoAndStop(this.allLives - this.lives);
                            this.score = this.score - 100;
                            this.sfxChannel.stop();
                            this.sfxChannel = this.wrongChoice.play();
                            this.point.texts.text = String(this.score);
                            this.animalArray[0].x = this.posArray[this.randomPoint.getNum()];
                            this.animalArray[0].y = -150;
                        }
                        this.animalArray[0].y = this.animalArray[0].y + this.itemSpeed;
                    }
                }
                if (this.levelNo > 1 && this.animalArray != null)
                {
                    if (this.animalArray[1].y > stage.stageHeight)
                    {
                        this.animalArray[1].x = this.posArray[this.randomPoint.getNum()];
                        this.animalArray[1].y = -150;
                    }
                    else
                    {
                        if (this.animalArray[1].hitTestObject(this.oyuncu.suzgec_alan_MC))
                        {
                            var _loc_3:String = this;
                            _loc_3.lives = this.lives--;
                            this.nehirBg.nega.gotoAndPlay(2);
                            this.canImg.gotoAndStop(this.allLives - this.lives);
                            this.score = this.score - 100;
                            this.sfxChannel.stop();
                            this.sfxChannel = this.wrongChoice.play();
                            this.point.texts.text = String(this.score);
                            this.animalArray[1].x = this.posArray[this.randomPoint.getNum()];
                            this.animalArray[1].y = -150;
                        }
                        this.animalArray[1].y = this.animalArray[1].y + this.itemSpeed;
                    }
                }
                if (this.levelNo > 2 && this.animalArray != null)
                {
                    if (this.animalArray[2].y > stage.stageHeight)
                    {
                        this.animalArray[2].x = this.posArray[this.randomPoint.getNum()];
                        this.animalArray[2].y = -150;
                    }
                    else
                    {
                        if (this.animalArray[2].hitTestObject(this.oyuncu.suzgec_alan_MC))
                        {
                            var _loc_3:String = this;
                            _loc_3.lives = this.lives--;
                            this.nehirBg.nega.gotoAndPlay(2);
                            this.canImg.gotoAndStop(this.allLives - this.lives);
                            this.score = this.score - 100;
                            this.sfxChannel.stop();
                            this.sfxChannel = this.wrongChoice.play();
                            this.point.texts.text = String(this.score);
                            this.animalArray[2].x = this.posArray[this.randomPoint.getNum()];
                            this.animalArray[2].y = -150;
                        }
                        this.animalArray[2].y = this.animalArray[2].y + this.itemSpeed;
                    }
                }
                if (this.trashArray != null && this.index3 < this.trashArray.length)
                {
                    if (this.trashArray[this.index3].y > stage.stageHeight)
                    {
                        var _loc_3:String = this;
                        _loc_3.lives = this.lives--;
                        this.nehirBg.nega.gotoAndPlay(2);
                        this.canImg.gotoAndStop(this.allLives - this.lives);
                        this.score = this.score - 100;
                        this.sfxChannel.stop();
                        this.sfxChannel = this.wrongChoice.play();
                        this.point.texts.text = String(this.score);
                        this.trashArray[this.index3].x = this.pos1[this.randomPoint2.getNum()];
                        this.trashArray[this.index3].y = -150;
                        var _loc_3:String = this;
                        _loc_3.index3 = this.index3++;
                        if (this.index3 >= this.trashArray.length)
                        {
                            this.index3 = 0;
                            this.trashArray[this.index1].x = this.pos1[this.randomPoint2.getNum()];
                            this.trashArray[this.index1].y = -150;
                        }
                    }
                    else
                    {
                        if (this.trashArray[this.index3].hitTestObject(this.oyuncu.suzgec_alan_MC))
                        {
                            this.score = this.score + 100;
                            this.nehirBg.plus.gotoAndPlay(2);
                            this.sfxChannel.stop();
                            this.sfxChannel = this.rightChoice.play();
                            this.point.texts.text = String(this.score);
                            this.trashArray[this.index3].x = this.pos1[this.randomPoint2.getNum()];
                            this.trashArray[this.index3].y = -150;
                            var _loc_3:* = this.toplam;
                            var _loc_4:* = this.index3;
                            _loc_3[_loc_4] = this.toplam[this.index3]--;
                            var _loc_3:String = this;
                            _loc_3.index3 = this.index3++;
                            if (this.index3 >= this.trashArray.length)
                            {
                                this.index3 = 0;
                                this.trashArray[this.index3].x = this.pos1[this.randomPoint2.getNum()];
                                this.trashArray[this.index3].y = -150;
                            }
                            if (this.nehirBg.kirlinehirmc.alpha > 0)
                            {
                                this.nehirBg.kirlinehirmc.alpha = this.nehirBg.kirlinehirmc.alpha - 0.05;
                            }
                        }
                        this.trashArray[this.index3].y = this.trashArray[this.index3].y + this.itemSpeed;
                    }
                }
                if (this.lives < 1)
                {
                    this.canImg.gotoAndStop(5);
                    removeEventListener(Event.ENTER_FRAME, this.MainScenes);
                    stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.KeyMoves);
                    this.endInterval.start();
                }
            }
            else
            {
                removeEventListener(Event.ENTER_FRAME, this.MainScenes);
                stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.KeyMoves);
                this.endInterval.start();
                this.score = 0;
            }
            return;
        }// end function

        private function FirstStage(event:MouseEvent)
        {
            this.sfxChannel.stop();
            this.sfxChannel = this.sfxVarious.play();
            this.init(1);
            addChild(this.info);
            this.info.cacheAsBitmap = true;
            this.info.gotoAndStop(1);
            this.info.ileriok.gotoAndStop(1);
            this.info.x = 0;
            this.info.y = 0;
            this.info.ileriok.addEventListener(MouseEvent.CLICK, this.NextPage);
            this.info.ileriok.buttonMode = true;
            return;
        }// end function

        private function KeyMoves(event:KeyboardEvent) : void
        {
            var _loc_2:* = event.keyCode;
            var _loc_3:* = 1.3 - 0.5;
            this.sfxChannel.stop();
            this.sfxChannel = this.playerMove.play();
            switch(_loc_2)
            {
                case Keyboard.LEFT:
                {
                    if (this.currentRoadLine > 0)
                    {
                        var _loc_4:String = this;
                        _loc_4.currentRoadLine = this.currentRoadLine--;
                        Tweener.addTween(this.oyuncu, {x:this.pos3[this.currentRoadLine], time:_loc_3});
                    }
                    break;
                }
                case Keyboard.RIGHT:
                {
                    if (this.currentRoadLine < this.pos3.length)
                    {
                        if (this.currentRoadLine != this.pos3.length--)
                        {
                            var _loc_4:String = this;
                            _loc_4.currentRoadLine = this.currentRoadLine++;
                        }
                        Tweener.addTween(this.oyuncu, {x:this.pos3[this.currentRoadLine], time:_loc_3});
                    }
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        private function Puanlama(txt2:Array) : Boolean
        {
            var _loc_2:Boolean = false;
            var _loc_3:int = 0;
            var _loc_4:uint = 0;
            while (_loc_4++ < txt2.length)
            {
                
                if (txt2[_loc_4] == 0 || txt2[_loc_4] < 0)
                {
                    _loc_3++;
                }
            }
            if (_loc_3 == txt2.length)
            {
                _loc_2 = true;
            }
            return _loc_2;
        }// end function

        private function BeginLast()
        {
            addChild(this.how);
            this.how.cacheAsBitmap = true;
            this.how.gotoAndStop(1);
            this.how.start_b.addEventListener(MouseEvent.CLICK, this.FinalScene);
            this.how.start_b.buttonMode = true;
            this.how.start_b.gotoAndStop(1);
            return;
        }// end function

        private function PopHelp(event:MouseEvent)
        {
            addChild(this.howLast);
            this.howLast.cacheAsBitmap = true;
            this.howLast.gotoAndStop(1);
            this.howLast.visible = true;
            this.howLast.closebtn.addEventListener(MouseEvent.CLICK, this.CloseHelp);
            this.endInterval.addEventListener(TimerEvent.TIMER, this.IntervalHandler);
            this.howLast.closebtn.buttonMode = true;
            this.howLast.closebtn.gotoAndStop(1);
            return;
        }// end function

        private function CloseHelp(event:MouseEvent)
        {
            this.howLast.closebtn.removeEventListener(MouseEvent.CLICK, this.CloseHelp);
            this.howLast.visible = false;
            return;
        }// end function

        private function FinalScene(event:MouseEvent)
        {
            this.sndTrans.volume = this.INGAME_VOLUME;
            if (this.bgmMute == false)
            {
                this.bgmChannel.stop();
                this.bgmLoopChannel.stop();
                this.bgmLoopChannel = this.bgmLoop.play(-1, -1, this.sndTrans);
                this.bgmLoopChannel.addEventListener(Event.SOUND_COMPLETE, this.IsSoundFinished);
                this.soundStr = "bgmLoop";
            }
            this.cont4 = new MovieClip();
            this.finalBg = new Kirli();
            this.panel = new Panel();
            addChild(this.finalBg);
            addChild(this.panel);
            addChild(this.cont4);
            this.traktorCounter = 0;
            this.counter = 0;
            this.trackIndex = 10;
            this.finalBg.mcaritma.visible = false;
            this.finalBg.mcturbin.visible = false;
            this.finalBg.mcorman.visible = false;
            this.finalBg.mcbaca.visible = false;
            this.finalBg.cacheAsBitmap = true;
            this.finalBg.cicekmc.visible = false;
            this.panel.cacheAsBitmap = true;
            this.panel.kp.lobi_b.gotoAndStop(1);
            this.panel.kp.yardim_b.gotoAndStop(1);
            this.panel.kp.lobi_b.addEventListener(MouseEvent.CLICK, this.GoLobi);
            this.panel.kp.yardim_b.addEventListener(MouseEvent.CLICK, this.PopHelp);
            this.interval2.addEventListener(TimerEvent.TIMER_COMPLETE, this.WaitForFiveS);
            this.panel.kp.yardim_b.buttonMode = true;
            this.panel.kp.lobi_b.buttonMode = true;
            this.gunes = new Sun();
            addChild(this.gunes);
            addChild(this.turbinIcon);
            addChild(this.aritmaIcon);
            addChild(this.ormanIcon);
            addChild(this.bacaIcon);
            var _loc_2:uint = 1;
            while (_loc_2++ < 5)
            {
                
                this.cont4.addChild(this["trak" + String(_loc_2)]);
            }
            this.cont4.addChild(this.copler);
            this.cont4.addChild(this.pompa);
            this.pops = new Pops();
            this.pops.bg.visible = false;
            this.pops.pop_cop.visible = false;
            this.pops.pop_aritma.visible = false;
            this.pops.pop_pompa.visible = false;
            this.pops.pop_orman.visible = false;
            this.pops.pop_turbin.visible = false;
            this.pops.pop_ilac.visible = false;
            this.pops.pop_baca.visible = false;
            this.gunes.alpha = 0;
            this.finalBg.kirlihava.alpha = 1;
            this.ormanAlan.x = 0;
            this.ormanAlan.y = 109;
            this.bacaAlan.x = 423.3;
            this.bacaAlan.y = 121.55;
            this.finalBg.x = 0;
            this.finalBg.y = 0;
            this.copler.x = 863.65;
            this.copler.y = 519;
            this.pompa.x = 124.9;
            this.pompa.y = 405.8;
            this.panel.x = 0;
            this.panel.y = stage.stageHeight - this.panel.height;
            this.ormanIcon.x = 430.85;
            this.ormanIcon.y = 646.9;
            this.bacaIcon.x = 545.3;
            this.bacaIcon.y = 641.4;
            this.turbinIcon.x = 583.5;
            this.turbinIcon.y = 651.7;
            this.aritmaIcon.x = 670.7;
            this.aritmaIcon.y = 650.4;
            this.turbinAlan.x = 0;
            this.turbinAlan.y = 0;
            this.aritmaAlan.x = 202.4;
            this.aritmaAlan.y = 286.5;
            this.pompaIcon.x = 947.4;
            this.pompaIcon.y = 650.35;
            this.coplerIcon.x = 1010.25;
            this.coplerIcon.y = 644.65;
            this.trak1.x = 779.6;
            this.trak1.y = 306.6;
            this.trak2.x = 1010.35;
            this.trak2.y = 320.55;
            this.trak3.x = 849.9;
            this.trak3.y = 415.55;
            this.trak4.x = 1002.85;
            this.trak4.y = 494.5;
            this.gunes.x = 640;
            this.gunes.y = 0;
            this.copler.addEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
            this.copler.addEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
            this.copler.buttonMode = true;
            this.pompa.addEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
            this.pompa.addEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
            this.pompa.buttonMode = true;
            _loc_2 = 1;
            while (_loc_2++ < 5)
            {
                
                this["trak" + String(_loc_2)].addEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
                this["trak" + String(_loc_2)].addEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
                this["trak" + String(_loc_2)].buttonMode = true;
            }
            this.ormanIcon.addEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
            this.ormanIcon.addEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
            this.ormanIcon.buttonMode = true;
            this.bacaIcon.addEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
            this.bacaIcon.addEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
            this.bacaIcon.buttonMode = true;
            this.turbinIcon.addEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
            this.turbinIcon.addEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
            this.turbinIcon.buttonMode = true;
            this.aritmaIcon.addEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
            this.aritmaIcon.addEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
            this.aritmaIcon.buttonMode = true;
            return;
        }// end function

        private function StartDragn(event:MouseEvent) : void
        {
            if (event.target == this.copler)
            {
                this.sfxChannel.stop();
                this.sfxChannel = this.sfxVarious.play();
                addChild(MovieClip(event.target));
                MovieClip(event.target).startDrag(false);
            }
            if (event.target == this.pompa)
            {
                this.sfxChannel.stop();
                this.sfxChannel = this.sfxVarious.play();
                addChild(MovieClip(event.target));
                MovieClip(event.target).startDrag(false);
            }
            if (event.target == this.trak1 || event.target == this.trak2 || event.target == this.trak3 || event.target == this.trak4)
            {
                addChild(MovieClip(event.target));
                switch(event.target)
                {
                    case this.trak1:
                    {
                        this.sfxChannel.stop();
                        this.sfxChannel = this.sfxVarious.play();
                        MovieClip(event.target).startDrag(false);
                        break;
                    }
                    case this.trak2:
                    {
                        this.sfxChannel.stop();
                        this.sfxChannel = this.sfxVarious.play();
                        MovieClip(event.target).startDrag(false);
                        break;
                    }
                    case this.trak3:
                    {
                        this.sfxChannel.stop();
                        this.sfxChannel = this.sfxVarious.play();
                        MovieClip(event.target).startDrag(false);
                        break;
                    }
                    case this.trak4:
                    {
                        this.sfxChannel.stop();
                        this.sfxChannel = this.sfxVarious.play();
                        MovieClip(event.target).startDrag(false);
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            if (event.target == this.ormanIcon)
            {
                this.sfxChannel.stop();
                this.sfxChannel = this.sfxVarious.play();
                this.ormanIcon.startDrag(false);
                addChildAt(this.ormanAlan, 0);
            }
            if (event.target == this.bacaIcon)
            {
                this.sfxChannel.stop();
                this.sfxChannel = this.sfxVarious.play();
                this.bacaIcon.startDrag(false);
                addChildAt(this.bacaAlan, 0);
            }
            if (event.target == this.turbinIcon)
            {
                this.sfxChannel.stop();
                this.sfxChannel = this.sfxVarious.play();
                this.turbinIcon.startDrag(false);
                addChildAt(this.turbinAlan, 0);
            }
            if (event.target == this.aritmaIcon)
            {
                this.sfxChannel.stop();
                this.sfxChannel = this.sfxVarious.play();
                this.aritmaIcon.startDrag(false);
                addChildAt(this.aritmaAlan, 0);
            }
            return;
        }// end function

        private function StopDragn(event:MouseEvent) : void
        {
            var _loc_2:* = new ColorTransform();
            _loc_2.color = 13421772;
            if (event.target == this.copler)
            {
                this.copler.stopDrag();
                if (this.copler.hitTestObject(this.panel.kp.area))
                {
                    this.sfxChannel.stop();
                    this.sfxChannel = this.rightChoice.play();
                    this.copler.removeEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
                    this.copler.removeEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
                    removeChild(this.copler);
                    addChild(this.coplerIcon);
                    addChild(this.pops);
                    this.finalBg.kirlihava.alpha = this.finalBg.kirlihava.alpha - 0.13;
                    this.finalBg.kirlitoprak.alpha = this.finalBg.kirlitoprak.alpha - 0.5;
                    this.finalBg.cicekmc.visible = true;
                    this.gunes.alpha = this.gunes.alpha + 0.16;
                    var _loc_3:String = this;
                    _loc_3.counter = this.counter++;
                    this.pops.pop_cop.visible = true;
                    this.pops.bg.visible = true;
                    this.pops.pop_cop.popx.addEventListener(MouseEvent.CLICK, this.PopTicker);
                    this.pops.pop_cop.popx.buttonMode = true;
                }
                else
                {
                    this.sfxChannel.stop();
                    this.sfxChannel = this.wrongChoice.play();
                    this.copler.x = 863.65;
                    this.copler.y = 521.6;
                }
            }
            if (event.target == this.pompa)
            {
                this.pompa.stopDrag();
                if (this.pompa.hitTestObject(this.panel.kp.area))
                {
                    this.sfxChannel.stop();
                    this.sfxChannel = this.rightChoice.play();
                    this.pompa.removeEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
                    this.pompa.removeEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
                    removeChild(this.pompa);
                    addChild(this.pompaIcon);
                    addChild(this.pops);
                    this.finalBg.kirlihava.alpha = this.finalBg.kirlihava.alpha - 0.13;
                    this.finalBg.kirlitoprak.alpha = this.finalBg.kirlitoprak.alpha - 0.1;
                    this.gunes.alpha = this.gunes.alpha + 0.16;
                    var _loc_3:String = this;
                    _loc_3.counter = this.counter++;
                    this.pops.pop_pompa.visible = true;
                    this.pops.bg.visible = true;
                    this.pops.pop_pompa.popx.addEventListener(MouseEvent.CLICK, this.PopTicker);
                    this.pops.pop_pompa.popx.buttonMode = true;
                }
                else
                {
                    this.sfxChannel.stop();
                    this.sfxChannel = this.wrongChoice.play();
                    this.pompa.x = 124.9;
                    this.pompa.y = 405.8;
                }
            }
            if (event.target == this.ormanIcon)
            {
                this.ormanIcon.stopDrag();
                removeChild(this.ormanAlan);
                if (this.ormanIcon.hitTestObject(this.ormanAlan))
                {
                    this.sfxChannel.stop();
                    this.sfxChannel = this.rightChoice.play();
                    this.ormanIcon.removeEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
                    this.ormanIcon.removeEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
                    removeChild(this.ormanIcon);
                    addChild(this.pops);
                    this.finalBg.kirlihava.alpha = this.finalBg.kirlihava.alpha - 0.13;
                    this.finalBg.kirlitoprak.alpha = this.finalBg.kirlitoprak.alpha - 0.1;
                    this.gunes.alpha = this.gunes.alpha + 0.16;
                    this.finalBg.mcorman.visible = true;
                    var _loc_3:String = this;
                    _loc_3.counter = this.counter++;
                    this.pops.pop_orman.visible = true;
                    this.pops.bg.visible = true;
                    this.pops.pop_orman.popx.addEventListener(MouseEvent.CLICK, this.PopTicker);
                    this.pops.pop_orman.popx.buttonMode = true;
                }
                else
                {
                    this.sfxChannel.stop();
                    this.sfxChannel = this.wrongChoice.play();
                    this.ormanIcon.x = 430.85;
                    this.ormanIcon.y = 646.9;
                }
            }
            if (event.target == this.bacaIcon)
            {
                this.bacaIcon.stopDrag();
                removeChild(this.bacaAlan);
                if (this.bacaIcon.hitTestObject(this.bacaAlan))
                {
                    this.sfxChannel.stop();
                    this.sfxChannel = this.rightChoice.play();
                    this.bacaIcon.removeEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
                    this.bacaIcon.removeEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
                    removeChild(this.bacaIcon);
                    addChild(this.pops);
                    this.finalBg.kirlihava.alpha = this.finalBg.kirlihava.alpha - 0.13;
                    this.finalBg.kirlitoprak.alpha = this.finalBg.kirlitoprak.alpha - 0.1;
                    this.gunes.alpha = this.gunes.alpha + 0.16;
                    this.finalBg.mcbaca.visible = true;
                    var _loc_3:String = this;
                    _loc_3.counter = this.counter++;
                    this.pops.pop_baca.visible = true;
                    this.pops.bg.visible = true;
                    this.finalBg.fabrika.dmn.transform.colorTransform = _loc_2;
                    this.pops.pop_baca.popx.addEventListener(MouseEvent.CLICK, this.PopTicker);
                    this.pops.pop_baca.popx.buttonMode = true;
                }
                else
                {
                    this.sfxChannel.stop();
                    this.sfxChannel = this.wrongChoice.play();
                    this.bacaIcon.x = 545.3;
                    this.bacaIcon.y = 641.4;
                }
            }
            if (event.target == this.turbinIcon)
            {
                this.turbinIcon.stopDrag();
                removeChild(this.turbinAlan);
                if (this.turbinIcon.hitTestObject(this.turbinAlan))
                {
                    this.sfxChannel.stop();
                    this.sfxChannel = this.rightChoice.play();
                    this.turbinIcon.removeEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
                    this.turbinIcon.removeEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
                    removeChild(this.turbinIcon);
                    addChild(this.pops);
                    this.finalBg.kirlihava.alpha = this.finalBg.kirlihava.alpha - 0.14;
                    this.finalBg.kirlitoprak.alpha = this.finalBg.kirlitoprak.alpha - 0.1;
                    this.gunes.alpha = this.gunes.alpha + 0.16;
                    this.finalBg.mcturbin.visible = true;
                    var _loc_3:String = this;
                    _loc_3.counter = this.counter++;
                    this.pops.pop_turbin.visible = true;
                    this.pops.bg.visible = true;
                    this.pops.pop_turbin.popx.addEventListener(MouseEvent.CLICK, this.PopTicker);
                    this.pops.pop_turbin.popx.buttonMode = true;
                }
                else
                {
                    this.sfxChannel.stop();
                    this.sfxChannel = this.wrongChoice.play();
                    this.turbinIcon.x = 583.5;
                    this.turbinIcon.y = 651.7;
                }
            }
            if (event.target == this.aritmaIcon)
            {
                this.aritmaIcon.stopDrag();
                removeChild(this.aritmaAlan);
                if (this.aritmaIcon.hitTestObject(this.aritmaAlan))
                {
                    this.sfxChannel.stop();
                    this.sfxChannel = this.rightChoice.play();
                    this.aritmaIcon.removeEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
                    this.aritmaIcon.removeEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
                    removeChild(this.aritmaIcon);
                    addChild(this.pops);
                    this.finalBg.kirlihava.alpha = this.finalBg.kirlihava.alpha - 0.13;
                    this.finalBg.kirlitoprak.alpha = this.finalBg.kirlitoprak.alpha - 0.1;
                    this.gunes.alpha = this.gunes.alpha + 0.16;
                    this.finalBg.mcaritma.visible = true;
                    var _loc_3:String = this;
                    _loc_3.counter = this.counter++;
                    this.pops.pop_aritma.visible = true;
                    this.pops.bg.visible = true;
                    this.pops.pop_aritma.popx.addEventListener(MouseEvent.CLICK, this.PopTicker);
                    this.pops.pop_aritma.popx.buttonMode = true;
                }
                else
                {
                    this.sfxChannel.stop();
                    this.sfxChannel = this.wrongChoice.play();
                    this.aritmaIcon.x = 673.75;
                    this.aritmaIcon.y = 647.9;
                }
                this.aritmaFlag = true;
            }
            if (event.target == this.trak1 || event.target == this.trak2 || event.target == this.trak3 || event.target == this.trak4)
            {
                switch(event.target)
                {
                    case this.trak1:
                    {
                        this.trak1.stopDrag();
                        if (this.trak1.hitTestObject(this.panel.kp.area))
                        {
                            this.sfxChannel.stop();
                            this.sfxChannel = this.rightChoice.play();
                            this.trak1.removeEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
                            this.trak1.removeEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
                            removeChild(this.trak1);
                            var _loc_3:String = this;
                            _loc_3.traktorCounter = this.traktorCounter++;
                            this.trackIndex--;
                        }
                        else
                        {
                            this.sfxChannel.stop();
                            this.sfxChannel = this.wrongChoice.play();
                            this.trak1.x = 779.6;
                            this.trak1.y = 306.6;
                        }
                        break;
                    }
                    case this.trak2:
                    {
                        this.trak2.stopDrag();
                        if (this.trak2.hitTestObject(this.panel.kp.area))
                        {
                            this.sfxChannel.stop();
                            this.sfxChannel = this.rightChoice.play();
                            this.trak2.removeEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
                            this.trak2.removeEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
                            removeChild(this.trak2);
                            var _loc_3:String = this;
                            _loc_3.traktorCounter = this.traktorCounter++;
                            this.trackIndex = this.trackIndex - 2;
                        }
                        else
                        {
                            this.sfxChannel.stop();
                            this.sfxChannel = this.wrongChoice.play();
                            this.trak2.x = 1010.35;
                            this.trak2.y = 320.55;
                        }
                        break;
                    }
                    case this.trak3:
                    {
                        this.trak3.stopDrag();
                        if (this.trak3.hitTestObject(this.panel.kp.area))
                        {
                            this.sfxChannel.stop();
                            this.sfxChannel = this.rightChoice.play();
                            this.trak3.removeEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
                            this.trak3.removeEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
                            removeChild(this.trak3);
                            var _loc_3:String = this;
                            _loc_3.traktorCounter = this.traktorCounter++;
                            this.trackIndex = this.trackIndex - 3;
                        }
                        else
                        {
                            this.sfxChannel.stop();
                            this.sfxChannel = this.wrongChoice.play();
                            this.trak3.x = 849.9;
                            this.trak3.y = 415.55;
                        }
                        break;
                    }
                    case this.trak4:
                    {
                        this.trak4.stopDrag();
                        if (this.trak4.hitTestObject(this.panel.kp.area))
                        {
                            this.sfxChannel.stop();
                            this.sfxChannel = this.rightChoice.play();
                            this.trak4.removeEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
                            this.trak4.removeEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
                            removeChild(this.trak4);
                            var _loc_3:String = this;
                            _loc_3.traktorCounter = this.traktorCounter++;
                            this.trackIndex = this.trackIndex - 4;
                        }
                        else
                        {
                            this.sfxChannel.stop();
                            this.sfxChannel = this.wrongChoice.play();
                            this.trak4.x = 1002.85;
                            this.trak4.y = 494.5;
                        }
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
                if (this.traktorCounter == 3)
                {
                    this.sfxChannel.stop();
                    this.sfxChannel = this.rightChoice.play();
                    this["trak" + String(this.trackIndex)].removeEventListener(MouseEvent.MOUSE_DOWN, this.StartDragn);
                    this["trak" + String(this.trackIndex)].removeEventListener(MouseEvent.MOUSE_UP, this.StopDragn);
                    this["trak" + String(this.trackIndex)].buttonMode = false;
                    addChild(this.trkatorIcon);
                    addChild(this.pops);
                    this.finalBg.kirlihava.alpha = this.finalBg.kirlihava.alpha - 0.13;
                    this.finalBg.kirlitoprak.alpha = this.finalBg.kirlitoprak.alpha - 0.1;
                    this.gunes.alpha = this.gunes.alpha + 0.16;
                    this.trkatorIcon.x = 844.25;
                    this.trkatorIcon.y = 639.35;
                    var _loc_3:String = this;
                    _loc_3.counter = this.counter++;
                    this.pops.pop_ilac.visible = true;
                    this.pops.bg.visible = true;
                    this.pops.pop_ilac.popx.addEventListener(MouseEvent.CLICK, this.PopTicker);
                    this.pops.pop_ilac.popx.buttonMode = true;
                }
            }
            return;
        }// end function

        private function WaitForFiveS(event:TimerEvent)
        {
            this.sfxChannel.stop();
            this.sfxChannel = this.success2.play();
            addChild(this.oyunSonu);
            this.oyunSonu.gotoAndPlay(2);
            this.interval2.stop();
            this.interval2.removeEventListener(TimerEvent.TIMER, this.WaitForFiveS);
            return;
        }// end function

        private function CongratsPage()
        {
            this.bgmChannel.stop();
            this.bgmChannel = this.success.play();
            addChild(this.nextBg);
            addChild(this.nextBtn);
            this.nextBg.x = 0;
            this.nextBg.y = 0;
            this.nextBtn.x = 852.5;
            this.nextBtn.y = 512.5;
            this.nextBtn.addEventListener(MouseEvent.CLICK, this.DoRestart, false, 0, true);
            this.nextBtn.buttonMode = true;
            if (this.levelNo > this.completed)
            {
                var _loc_1:String = this;
                _loc_1.completed = this.completed++;
            }
            return;
        }// end function

        private function DoRestart(event:MouseEvent)
        {
            this.bgmChannel.stop();
            this.InitLobi();
            return;
        }// end function

        private function GoToSecond(event:MouseEvent) : void
        {
            this.sfxChannel.stop();
            this.sfxChannel = this.sfxVarious.play();
            this.levelNo = 2;
            this.lives = 3;
            this.init(this.levelNo);
            this.Cleaner(0);
            this.InitMain();
            return;
        }// end function

        private function GoToThird(event:MouseEvent) : void
        {
            this.sfxChannel.stop();
            this.sfxChannel = this.sfxVarious.play();
            this.levelNo = 3;
            this.lives = 3;
            this.init(this.levelNo);
            this.Cleaner(0);
            this.InitMain();
            return;
        }// end function

        private function GoToLast(event:MouseEvent) : void
        {
            this.sfxChannel.stop();
            this.sfxChannel = this.sfxVarious.play();
            this.levelNo = 4;
            this.init(this.levelNo);
            this.Cleaner(1);
            return;
        }// end function

        private function InitRestart() : void
        {
            this.init(-1);
            return;
        }// end function

        private function IntervalHandler(event:TimerEvent)
        {
            if (this.lives == 0)
            {
                this.InitRestart();
            }
            if (this.lives != 0)
            {
                this.CongratsPage();
            }
            this.endInterval.stop();
            this.endInterval.removeEventListener(TimerEvent.TIMER, this.IntervalHandler);
            return;
        }// end function

        private function DisplayHtp(event:MouseEvent)
        {
            if (this.htpScreen)
            {
                addChild(this.htpScreen);
                this.titleBg.helpb.removeEventListener(MouseEvent.CLICK, this.DisplayHtp);
                this.htpScreen.x = 0;
                this.htpScreen.y = 0;
                this.htpScreen.scr.gerib.addEventListener(MouseEvent.CLICK, this.BackLobi);
                this.htpScreen.scr.gerib.buttonMode = true;
            }
            return;
        }// end function

        private function BackLobi(event:MouseEvent)
        {
            removeChild(this.htpScreen);
            this.titleBg.helpb.addEventListener(MouseEvent.CLICK, this.DisplayHtp);
            this.htpScreen.scr.gerib.removeEventListener(MouseEvent.CLICK, this.BackLobi);
            this.htpScreen.scr.gerib.buttonMode = false;
            return;
        }// end function

        private function GoLobi(event:MouseEvent)
        {
            if (this.levelNo != 4)
            {
                stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.KeyMoves);
                removeEventListener(Event.ENTER_FRAME, this.MainScenes);
            }
            else
            {
                this.interval2.stop();
                this.interval2.removeEventListener(TimerEvent.TIMER, this.WaitForFiveS);
            }
            this.InitLobi();
            return;
        }// end function

        private function NextPage(event:MouseEvent)
        {
            this.info.gotoAndStop(2);
            this.info.geriok.addEventListener(MouseEvent.CLICK, this.PrevPage);
            this.info.asli_b.addEventListener(MouseEvent.CLICK, this.CharSelection);
            this.info.can_b.addEventListener(MouseEvent.CLICK, this.CharSelection);
            this.info.geriok.gotoAndStop(1);
            this.info.asli_b.gotoAndStop(1);
            this.info.can_b.gotoAndStop(1);
            this.info.geriok.buttonMode = true;
            this.info.asli_b.buttonMode = true;
            this.info.can_b.buttonMode = true;
            return;
        }// end function

        private function PrevPage(event:MouseEvent)
        {
            this.info.gotoAndStop(1);
            this.info.ileriok.addEventListener(MouseEvent.CLICK, this.NextPage);
            this.info.ileriok.gotoAndStop(1);
            this.info.ileriok.buttonMode = true;
            return;
        }// end function

        private function CharSelection(event:MouseEvent)
        {
            if (event.target.name == "asli_b")
            {
                this.char = 1;
            }
            else if (event.target.name == "can_b")
            {
                this.char = 0;
            }
            this.info.gotoAndStop(3);
            this.info.oyunbasla.gotoAndStop(1);
            this.info.oyunbasla.addEventListener(MouseEvent.CLICK, this.StartGame);
            this.info.oyunbasla.buttonMode = true;
            return;
        }// end function

        private function StartGame(event:MouseEvent)
        {
            this.InitMain();
            return;
        }// end function

        private function ReturnGame(event:MouseEvent)
        {
            addEventListener(Event.ENTER_FRAME, this.MainScenes);
            stage.addEventListener(KeyboardEvent.KEY_DOWN, this.KeyMoves);
            this.ingameHelp.visible = false;
            return;
        }// end function

        private function PauseGame(event:MouseEvent)
        {
            this.point.play_b.removeEventListener(MouseEvent.CLICK, this.ResumeGame);
            removeEventListener(Event.ENTER_FRAME, this.MainScenes);
            stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.KeyMoves);
            this.point.play_b.gotoAndStop(2);
            this.point.play_b.addEventListener(MouseEvent.CLICK, this.ResumeGame);
            this.point.play_b.buttonMode = true;
            return;
        }// end function

        private function ResumeGame(event:MouseEvent)
        {
            this.point.play_b.removeEventListener(MouseEvent.CLICK, this.PauseGame);
            addEventListener(Event.ENTER_FRAME, this.MainScenes);
            stage.addEventListener(KeyboardEvent.KEY_DOWN, this.KeyMoves);
            this.point.play_b.gotoAndStop(1);
            this.point.play_b.addEventListener(MouseEvent.CLICK, this.PauseGame);
            this.point.play_b.buttonMode = true;
            return;
        }// end function

        private function ShowIngameHelp(event:MouseEvent)
        {
            if (this.ingameHelp.stage == null)
            {
                removeEventListener(Event.ENTER_FRAME, this.MainScenes);
                stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.KeyMoves);
                addChild(this.ingameHelp);
                this.ingameHelp.ok_b.addEventListener(MouseEvent.CLICK, this.ReturnGame);
                this.ingameHelp.ok_b.buttonMode = true;
            }
            else
            {
                removeEventListener(Event.ENTER_FRAME, this.MainScenes);
                stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.KeyMoves);
                this.ingameHelp.visible = true;
            }
            return;
        }// end function

        private function YildizLoaderHandler()
        {
            if (this.completed == 1)
            {
                this.yildiz1.k1.visible = true;
                this.yildiz2.visible = true;
                this.titleBg.y2mc.visible = false;
                this.yildiz2.addEventListener(MouseEvent.CLICK, this.GoToSecond);
                this.yildiz2.buttonMode = true;
            }
            if (this.completed == 2)
            {
                this.yildiz1.k1.visible = true;
                this.yildiz2.k2.visible = true;
                this.yildiz3.visible = true;
                this.yildiz2.visible = true;
                this.titleBg.y2mc.visible = false;
                this.titleBg.y3mc.visible = false;
                this.yildiz3.addEventListener(MouseEvent.CLICK, this.GoToThird);
                this.yildiz3.buttonMode = true;
            }
            if (this.completed == 3)
            {
                this.yildiz1.k1.visible = true;
                this.yildiz2.k2.visible = true;
                this.yildiz3.k3.visible = true;
                this.yildiz2.visible = true;
                this.yildiz3.visible = true;
                this.yildizSon.visible = true;
                this.titleBg.y2mc.visible = false;
                this.titleBg.y3mc.visible = false;
                this.titleBg.y4mc.visible = false;
                this.yildizSon.addEventListener(MouseEvent.CLICK, this.GoToLast);
                this.yildizSon.buttonMode = true;
            }
            if (this.completed == 4)
            {
                this.yildiz1.k1.visible = true;
                this.yildiz2.k2.visible = true;
                this.yildiz3.k3.visible = true;
                this.yildizSon.k4.visible = true;
                this.yildiz2.visible = true;
                this.yildiz3.visible = true;
                this.yildizSon.visible = true;
                this.titleBg.y2mc.visible = false;
                this.titleBg.y3mc.visible = false;
                this.titleBg.y4mc.visible = false;
            }
            return;
        }// end function

        private function PopTicker(event:MouseEvent)
        {
            this.oyunSonu = new OyunSon();
            if (this.pops.pop_cop.visible)
            {
                this.pops.pop_cop.visible = false;
                this.pops.bg.visible = false;
                if (this.counter == 7)
                {
                    this.interval2.start();
                    this.completed = 4;
                }
            }
            if (this.pops.pop_aritma.visible)
            {
                this.pops.pop_aritma.visible = false;
                this.pops.bg.visible = false;
                if (this.counter == 7)
                {
                    this.interval2.start();
                    this.completed = 4;
                }
            }
            if (this.pops.pop_turbin.visible)
            {
                this.pops.pop_turbin.visible = false;
                this.pops.bg.visible = false;
                if (this.counter == 7)
                {
                    this.interval2.start();
                    this.completed = 4;
                }
            }
            if (this.pops.pop_ilac.visible)
            {
                this.pops.pop_ilac.visible = false;
                this.pops.bg.visible = false;
                if (this.counter == 7)
                {
                    this.interval2.start();
                    this.completed = 4;
                }
            }
            if (this.pops.pop_pompa.visible)
            {
                this.pops.pop_pompa.visible = false;
                this.pops.bg.visible = false;
                if (this.counter == 7)
                {
                    this.interval2.start();
                    this.completed = 4;
                }
            }
            if (this.pops.pop_orman.visible)
            {
                this.pops.pop_orman.visible = false;
                this.pops.bg.visible = false;
                if (this.counter == 7)
                {
                    this.interval2.start();
                    this.completed = 4;
                }
            }
            if (this.pops.pop_baca.visible)
            {
                this.pops.pop_baca.visible = false;
                this.pops.bg.visible = false;
                if (this.counter == 7)
                {
                    this.interval2.start();
                    this.completed = 4;
                }
            }
            return;
        }// end function

        private function Cleaner(param1:int)
        {
            if (this.finalBg != null && param1 == 0 && !this.once)
            {
                removeChild(this.finalBg);
                this.finalBg = null;
                this.once = !this.once;
            }
            if (this.nehirBg != null && param1 == 1 && this.once)
            {
                removeChild(this.cont1);
                removeChild(this.cont2);
                removeChild(this.cont3);
                this.cont1 = null;
                this.cont2 = null;
                this.cont3 = null;
                removeEventListener(Event.ENTER_FRAME, this.MainScenes);
                stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.KeyMoves);
                this.once = false;
            }
            return;
        }// end function

        private function BgmControl(event:MouseEvent)
        {
            if (this.bgmMute === false)
            {
                event.target.gotoAndStop(2);
                this.SetVol();
                this.bgmMute = true;
            }
            else if (this.bgmMute === true)
            {
                event.target.gotoAndStop(1);
                if (this.soundStr == "bgmLoop")
                {
                    this.SetVol(this.INGAME_VOLUME);
                }
                else if (this.soundStr == "introMusic")
                {
                    this.SetVol(this.MAIN_VOLUME);
                }
                this.bgmMute = false;
            }
            return;
        }// end function

        private function SetVol(param1:Number = 0)
        {
            this.sndTrans.volume = param1;
            if (this.soundStr == "bgmLoop")
            {
                this.bgmLoopChannel.soundTransform = this.sndTrans;
            }
            else if (this.soundStr == "introMusic")
            {
                this.bgmChannel.soundTransform = this.sndTrans;
            }
            return;
        }// end function

        private function IsSoundFinished(event:Event)
        {
            removeEventListener(Event.SOUND_COMPLETE, this.IsSoundFinished);
            if (this.soundStr == "bgmLoop")
            {
                if (this.sndTrans.volume !== 0)
                {
                    this.sndTrans.volume = this.INGAME_VOLUME;
                }
                this.bgmLoopChannel = this[this.soundStr].play(0, 999, this.sndTrans);
                addEventListener(Event.SOUND_COMPLETE, this.IsSoundFinished);
            }
            else if (this.soundStr == "introMusic")
            {
                if (this.sndTrans.volume !== 0)
                {
                    this.sndTrans.volume = this.MAIN_VOLUME;
                }
                this.bgmChannel = this[this.soundStr].play(0, 999, this.sndTrans);
                addEventListener(Event.SOUND_COMPLETE, this.IsSoundFinished);
            }
            return;
        }// end function

    }
}
