#!/bin/bash
platform='unknown'
unamestr=$(uname)
token=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 32; echo)
sudo clear
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
   echo "$platform OS Detected. Installing LightWeeb for Debian like Distros"
   sudo apt update
   sudo apt upgrade -y
   clear
   sudo apt install -y shc 
   clear
   sudo apt install -y unzip
   clear
   sudo apt install -y zip
   clear
   sudo apt install -y dialog
   clear
   domain=$(dialog --title 'LightWeeb 3.0.30' --inputbox 'Enter your staging domain' 0 0  --output-fd 1)
   prod_domain=$(dialog --title 'LightWeeb 3.0.30' --inputbox 'Enter your production domain' 0 0  --output-fd 1)
   images_server=$(dialog --title 'LightWeeb 3.0.30' --inputbox 'Enter your images host (images.mycompany.com)' 0 0  --output-fd 1)
   country_code=$(dialog --menu "HQ Country" 20 45 35 AF "Afghanistan" AX "Aland Islands" AL "Albania" DZ "Algeria" AS "American Samoa" AD "Andorra" AO "Angola" AI "Anguilla" AQ "Antarctica" AG "Antigua and Barbuda" AR "Argentina" AM "Armenia" AW "Aruba" AU "Australia" AT "Austria" AZ "Azerbaijan" BS "Bahamas" BH "Bahrain" BD "Bangladesh" BB "Barbados" BY "Belarus" BE "Belgium" BZ "Belize" BJ "Benin" BM "Bermuda" BT "Bhutan" BO "Bolivia" BQ "Bonaire, Sint Eustatius and Saba" BA "Bosnia and Herzegovina" BW "Botswana" BV "Bouvet Island" BR "Brazil" IO "British Indian Ocean Territory" BN "Brunei" BG "Bulgaria" BF "Burkina Faso" BI "Burundi" KH "Cambodia" CM "Cameroon" CA "Canada" CV "Cape Verde" KY "Cayman Islands" CF "Central African Republic" TD "Chad" CL "Chile" CN "China" CX "Christmas Island" CC "Cocos (Keeling) Islands" CO "Colombia" KM "Comoros" CG "Congo" CK "Cook Islands" CR "Costa Rica" CI "Cote d'ivoire (Ivory Coast)" HR "Croatia" CU "Cuba" CW "Curacao" CY "Cyprus" CZ "Czech Republic" CD "Democratic Republic of the Congo" DK "Denmark" DJ "Djibouti" DM "Dominica" DO "Dominican Republic" EC "Ecuador" EG "Egypt" SV "El Salvador" GQ "Equatorial Guinea" ER "Eritrea" EE "Estonia" ET "Ethiopia" FK "Falkland Islands (Malvinas)" FO "Faroe Islands" FJ "Fiji" FI "Finland" FR "France" GF "French Guiana" PF "French Polynesia" TF "French Southern Territories" GA "Gabon" GM "Gambia" GE "Georgia" DE "Germany" GH "Ghana" GI "Gibraltar" GR "Greece" GL "Greenland" GD "Grenada" GP "Guadaloupe" GU "Guam" GT "Guatemala" GG "Guernsey" GN "Guinea" GW "Guinea-Bissau" GY "Guyana" HT "Haiti" HM "Heard Island and McDonald Islands" HN "Honduras" HK "Hong Kong" HU "Hungary" IS "Iceland" IN "India" ID "Indonesia" IR "Iran" IQ "Iraq" IE "Ireland" IM "Isle of Man" IL "Israel" IT "Italy" JM "Jamaica" JP "Japan" JE "Jersey" JO "Jordan" KZ "Kazakhstan" KE "Kenya" KI "Kiribati" XK "Kosovo" KW "Kuwait" KG "Kyrgyzstan" LA "Laos" LV "Latvia" LB "Lebanon" LS "Lesotho" LR "Liberia" LY "Libya" LI "Liechtenstein" LT "Lithuania" LU "Luxembourg" MO "Macao" MK "North Macedonia" MG "Madagascar" MW "Malawi" MY "Malaysia" MV "Maldives" ML "Mali" MT "Malta" MH "Marshall Islands" MQ "Martinique" MR "Mauritania" MU "Mauritius" YT "Mayotte" MX "Mexico" FM "Micronesia" MD "Moldava" MC "Monaco" MN "Mongolia" ME "Montenegro" MS "Montserrat" MA "Morocco" MZ "Mozambique" MM "Myanmar (Burma)" NA "Namibia" NR "Nauru" NP "Nepal" NL "Netherlands" NC "New Caledonia" NZ "New Zealand" NI "Nicaragua" NE "Niger" NG "Nigeria" NU "Niue" NF "Norfolk Island" KP "North Korea" MP "Northern Mariana Islands" NO "Norway" OM "Oman" PK "Pakistan" PW "Palau" PS "Palestine" PA "Panama" PG "Papua New Guinea" PY "Paraguay" PE "Peru" PH "Philippines" PN "Pitcairn" PL "Poland" PT "Portugal" PR "Puerto Rico" QA "Qatar" RE "Reunion" RO "Romania" RU "Russia" RW "Rwanda" BL "Saint Barthelemy" SH "Saint Helena" KN "Saint Kitts and Nevis" LC "Saint Lucia" MF "Saint Martin" PM "Saint Pierre and Miquelon" VC "Saint Vincent and the Grenadines" WS "Samoa" SM "San Marino" ST "Sao Tome and Principe" SA "Saudi Arabia" SN "Senegal" RS "Serbia" SC "Seychelles" SL "Sierra Leone" SG "Singapore" SX "Sint Maarten" SK "Slovakia" SI "Slovenia" SB "Solomon Islands" SO "Somalia" ZA "South Africa" GS "South Georgia and the South Sandwich Islands" KR "South Korea" SS "South Sudan" ES "Spain" LK "Sri Lanka" SD "Sudan" SR "Suriname" SJ "Svalbard and Jan Mayen" SZ "Swaziland" SE "Sweden" CH "Switzerland" SY "Syria" TW "Taiwan" TJ "Tajikistan" TZ "Tanzania" TH "Thailand" TL "Timor-Leste (East Timor)" TG "Togo" TK "Tokelau" TO "Tonga" TT "Trinidad and Tobago" TN "Tunisia" TR "Turkey" TM "Turkmenistan" TC "Turks and Caicos Islands" TV "Tuvalu" UG "Uganda" UA "Ukraine" AE "United Arab Emirates" GB "United Kingdom" US "United States" UM "United States Minor Outlying Islands" UY "Uruguay" UZ "Uzbekistan" VU "Vanuatu" VA "Vatican City" VE "Venezuela" VN "Vietnam" VG "Virgin Islands, British" VI "Virgin Islands, US" WF "Wallis and Futuna" EH "Western Sahara" YE "Yemen" ZM "Zambia" ZW "Zimbabwe" 0 0  --output-fd 1)
   webname=$(dialog --title 'LightWeeb 3.0.30' --inputbox 'What is the name of your website' 0 0  --output-fd 1) 
   company=$(dialog --title 'LightWeeb 3.0.30' --inputbox 'Company' 0 0  --output-fd 1)
   telephone=$(dialog --title 'LightWeeb 3.0.30' --inputbox 'Telephone' 0 0  --output-fd 1)
   background_color=$(dialog --title 'LightWeeb 3.0.30' --inputbox 'Background Color HEX' 0 0  --output-fd 1)
   theme_color=$(dialog --title 'LightWeeb 3.0.30' --inputbox 'Theme Color HEX' 0 0  --output-fd 1)
    mkdir -p $domain;
    echo -ne '#                         (  0%)\r'
    sleep 1
    wget -q https://github.com/ruvenss/lightweb/archive/refs/tags/3.0.28.zip -O "lightweeb.zip"
    echo -ne '#####                     ( 20%)\r'
    sleep 1
    unzip -qq ./"lightweeb.zip" && rm ./"lightweeb.zip"
    echo -ne '###########               ( 40%)\r'
    sleep 1
    sudo cp -aRf lightweeb-3.0.30/. $domain
    sudo rm -rf lightweeb-3.0.30
    chmod 777 $domain
    echo -ne '#################         ( 60%)\r'
    sleep 1
    sudo shc -f $domain/lightweb/ToProduction.sh $domain/lightweb/ToProduction
    sudo rm -f $domain/lightweb/ToProduction.sh
    sudo rm -f $domain/lightweb/ToProduction.sh.x.c
    sudo rm -f $domain/lightweb/ToProduction.sh.x
    echo -ne '#######################   ( 90%)\r'
    sleep 1
    sudo rm -f $domain/.gitignore
    sudo chown -R www-data:www-data $domain
    echo -ne '##########################(100%)\r'
    sleep 1
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
  
   platform='macosx'
   brew list shc || brew install shc
   brew list ncurses || brew install ncurses
   brew list dialog || brew install dialog
   clear
   domain=$(dialog --title 'LightWeeb 3.0.30' --inputbox 'Enter your staging domain' 0 0  --output-fd 1)
    find 2>/dev/null |while read f;
    do
        mkdir -p $domain;
        sleep 1
    done|dialog --title "Installing LightWeeb in $platform" --gauge "$domain ...." 10 60 0
    find 2>/dev/null |while read f;
    do
        wget -q https://github.com/ruvenss/lightweb/archive/refs/tags/3.0.30.zip -O "lightweeb.zip"
    done|dialog --title "Downloading LightWeb ..." --gauge "Please wait ...." 10 60 20
    find 2>/dev/null |while read f;
    do
        unzip -qq ./"lightweb.zip" && rm ./"lightweeb.zip"
        sleep 1
    done|dialog --title "Uncompressing LightWeeb ..." --gauge "Please wait ...." 10 60 30
    find 2>/dev/null |while read f;
    do
        sudo cp -aRf lightweb-3.0.30/. $domain
        sudo rm -rf lightweb-3.0.30
        chmod 777 $domain
        sleep 1
    done|dialog --title "Installing LightWeeb ..." --gauge "Please wait ...." 10 60 40
    find 2>/dev/null |while read f;
    do
        sudo shc -f $domain/lightweb/ToProduction.sh $domain/lightweb/ToProduction
        sudo rm -f $domain/lightweb/ToProduction.sh
        sudo rm -f $domain/lightweb/ToProduction.sh.x.c
        sudo rm -f $domain/lightweb/ToProduction.sh.x
        sleep 1
    done|dialog --title "Compiling LightWeeb ..." --gauge "Please wait ...." 10 60 60
    find 2>/dev/null |while read f;
    do
        sudo rm -f $domain/.gitignore
        sudo chown -R www-data:www-data $domain
        sleep 1
    done|dialog --title "Grooming LightWeeb ..." --gauge "Please wait ...." 10 60 90

fi
dialog --msgbox "Your LightWeb is ready to use at https://$domain" 0 0
cd $domain
cd lightweb
mv config_sample.php config.php
sed -i -e "s/My_secret_key/$token/g" config.php
sed -i -e "s/stage.mydomain.com/$domain/g" config.php
sed -i -e "s/mydomain.com/$prod_domain/g" config.php
sed -i -e "s/images.mycompany.com/$images_server/g" config.php
sed -i -e "s/WEB NAME/$webname/g" config.php
sed -i -e "s/MY COMPANY/$company/g" config.php
sed -i -e "s/+1555555555/$telephone/g" config.php
sed -i -e "s/1940b0/$background_color/g" config.php
sed -i -e "s/ffffff/$theme_color/g" config.php
chown www-data:www-data config.php
clear
nano config.php
