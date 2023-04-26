class Demo {
  static String getInvoiceContent() {
    return """
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width">
    <meta http-equiv="Content-type" name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width"> -->
    <title>SALE INVOICE</title>


</head>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Khmer&display=swap');
    @page {
        footer: page-footer;
        margin: 1cm;
        margin-top: 35pt;
        margin-bottom: 50pt;
        margin-footer: 18pt;
    }
    
    @page :first {
        margin-top: 0;
    }
    
    *,
    html {
        padding: 0;
        margin: 0;
        font-family: 'KhmerOS', DejaVu Sans !important;
    }
    
    * {
        -webkit-print-color-adjust: true;
        -webkit-print-color-adjust: exact;
    }
    
    body,
    p {
        margin: 0px;
        padding: 0px;
        font-family: 'khmeros', serif;
    }
    
    body {
        background: white;
    }
    
    p {
        line-height: 22px;
    }
    
    .invoice {
        margin: auto;
    }
    
    .container {
        padding: 5px 15px;
    }
    
    hr {
        border-top: 1px dashed silver;
    }
    
    .text-center {
        text-align: center;
    }
    
    .text-left {
        text-align: left;
    }
    
    .text-right {
        text-align: left;
    }
    
    .text-justify {
        text-align: justify;
    }
    
    .right {
        float: right;
    }
    
    .left {
        float: left;
    }
    
    .total {
        font-size: 1.5em;
        margin: 5px;
    }
    
    a {
        color: #000;
    }
    
    span {
        color: #000;
    }
    
    .full-width {
        width: 100%;
    }
    
    .width-100 {
        width: 100px;
    }
    
    .width-200 {
        width: 200px;
    }
    
    .width-300 {
        width: 300px;
    }
    
    .width-400 {
        width: 400px;
    }
    
    .inline-block {
        display: inline-block;
    }
    
    .flex {
        display: flex;
    }
    
    .half {
        width: 50%;
    }
    
    .padding_left {
        padding-left: 15px;
    }
    
    .padding_right {
        padding-right: 15px;
    }
    
    td {
        border: 1px solid silver;
        padding: 6px;
        border-collapse: collapse;
    }
    
    thead td {
        background: #fff;
        /* #1565c0; */
        color: #fff;
    }
    
    table {
        width: 100%;
    }
    
    thead td,
    tfoot td {
        font-weight: bold;
    }
    
    @page {
        margin: 0;
        size: A4;
    }
    
    header,
    footer {
        margin: auto;
    }
    
    .logo {
        width: 55px;
        height: 55px;
        background-position: center;
        /* Center the image */
        background-repeat: no-repeat;
        /* Do not repeat the image */
        background-size: cover;
    }
    
    .logo img {
        width: 100%;
    }
    
    header,
    footer {
        position: fixed;
        transform: translate3d(0, 0, 0);
    }
    
    footer {
        bottom: 0;
    }
    
    .page-break {
        page-break-after: always;
    }
    
    .capitalize {
        text-transform: capitalize;
    }
</style>

<body>
    <div class="invoice">
        <div class="container">
            <div class="full-width inline-block">
                <div class="logo" style="float: left;position:absolute; background-image: url(data:image/jpg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD//gA7Q1JFQVRPUjogZ2QtanBlZyB2MS4wICh1c2luZyBJSkcgSlBFRyB2NjIpLCBxdWFsaXR5ID0gOTAK/9sAQwADAgIDAgIDAwMDBAMDBAUIBQUEBAUKBwcGCAwKDAwLCgsLDQ4SEA0OEQ4LCxAWEBETFBUVFQwPFxgWFBgSFBUU/9sAQwEDBAQFBAUJBQUJFA0LDRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU/8AAEQgAZABkAwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A/VCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK4H44fEiP4WfDvUdZ3hLrHk22QD+8IJzg8Haqs2D1Kgd61pUpVqkacFdt2Ma1aGHpyq1HZRV2cf8AHr9p/RPg9C9jBs1HXSMeSDlIjjI3AEFmwQduRgdWXK7vinxp+1f8QvGF1I41mfT4SflitpCoA/ulVwjD3Kk+5ry/xBr194t1ye/u3ee6uJCQCxY8knGTyTkkknkkknJJNfW/w1/ZE8N/DPQv+Ey+MmqWltbQASf2W0uIIz2WVhzK57Rp1PHzZxX6vDAZbkNCM8Uueo9tLtvskfi9TMc14kxEoYSXJSjvrZJd5M+b9O+OfjrTLgTQeI7xDnkRv5e76lMH8jXv/wAIP26dX0+8gsPGEa39oxC/aBhXT6Nx/wCP5yTy6gV37N8Cv2tbd9E01R4d8QWgMVhILZLO5ZB0KKPllTjOw/MBnhetfJfxu+B2vfAvxJBpusPBdW14ryWV9bn5bhFIDfKeVYblyD6jBPWtqUstzdvC4ih7Kr2as/VPS5jVhmuSJYzC4j2tH+ZO69Grux+qPhzxHp3izR7fVNKuVu7KcZSReCOxBB5BB4IPINaVfAH7EnxouPD/AIsTwpqFwzadflY4954RzhUx75Kp9GGTiNRX3/X5rmuXTyzEuhLVbp90frGTZpDNsIsRFWezXZhRRRXjnuBRRRQAUUUUAFfIf/BQvV5rbw14csUYiG4kl8xexOY2U/hsb/vqvryvl39vfwjNrXw+0zVoUMn9nyyKwUdNwVtx9gscn4sB3r3silCOZUXPa/6HzfEcZzyquob2/VXPgXR/+QvY/wDXeP8A9CFfaf7eXhy+8beP/hP4dsHRbnUXvYIRM+2MSM9soZvoCecZxnFfEltO1rcRTIAXjcOAemQc1+ilhF4N/bP0Dwv4it7640XxH4au0nlghYGa2YsjPGR3R/LUrIOm31DLX6Tn05YXE4bGte7DmTdr2bVldep+V8OU44vCYrARfvz5Gle11F3lZ+h8g/Fj4D+If2f/ABj4ei1K7gu4b2RZrO/siyjejruXBwVZSyn6EYPXHtv/AAUg/wCQz8PP+vfUf/QrWqX7V3j63+NXxs8HeAvC5F++k3rW9xcxfMjXMjxh0B9IljO49Mlh/Cazf+ChPjGy1v4keHtAtZFluNDspXuipzse4aNgh9wkSt9JBXn4atiMZi8BVxC9+02/S1k2vM9LF4fDYHBZlRwz/d3ppa31vdpPrY+dPAuozaV4v0q5t2Mc6zBEcdVLfLn8M5r9hrWcXNtFMBgSIGA+ozX5H/B7wpP4z+Imj6ZAhZpZgCw/gyQqt9AzKT7ZPav10RBGgVRhQMAeleZxlKDr0YrdJ3+/Q9XgSM1Qryfwtq33O4tFFFfnZ+ohRRRQAUUVHPcRWsLzTyJDCg3NJIwVVHqSelAElZHi7wxZ+M/Dl/o1+uba7j2FgASjA5VhnjKsARnjIrRhvbe4tVuYp4pLZhuWZHBQj1B6U8zRqEJdQHOFJP3vpVRk4tSjuiZRjOLjJXTPyi+NnwY1j4R+Kbqzu7ZvsJbdDOgJQqTwQT/CexP0PzAiuM8OeK9a8IXsl5oeq3mkXUkTQPNZTNE7Rt1UkHp/UA9QK/W3xh4Y8M+PtPbStbitb1CSqq0gEiMeDtIOQT0I79DkcV8y+OP2AtLuJprvQtaW1i5bybs+UFHUlnCsPwVFAr9Uy/ijDVqPscwWu17XT9T8czLhHF4et7fLXdbpXs16Hzr8Jfix4e+Cfh641fRtMn1f4i3UbwW9zexqtlpcZyNyDcWlkYc9FGDjPXd5fcXGo+J9anubiWfU9Vvpmmmmf5pJpGJLMf19h9K+qdE/YIvNQaOWXxPpctk7bRPZ3hk59B+6wx9sivoL4WfsoeC/hhNDczIur6lkbZLhdse4c5CEknoDhmIBAIANb1c9yvBynXotzqS/LovJLt+ZzUeHc3x8KeGrpU6Ufz6t9W33/JHDfsbfs9TeCbIeLNch2ajcJm1iYcqCCN//AHyWA9dzHkFTX1RVa61OzsZYYrm7gt5ZjtiSWRVZz6KCefwqXz4sOfMTCffO4fL9fSvzDG4yrj68q9V6v8PI/XcvwFHLcPHDUVovxfckoqrc6pZWfkefeQQeedsXmSqvmH0XJ5P0q1XCeiFFFFABXyF+0Notn8af2y/hn8KPF2+5+H8Xh298SzaM0jJb6tepKIo45gCN4iUGQL05OQRX17Xlnxv/AGdfDnx0fQL6/v8AV/DniXw/M8+keJPD139mv7IuAsio5VgUcABlZSDigD4R+P3hyx+CGp/tN/C7wYrWXw/vfh3b+J/7FjkZ7bS783awssSknyxInzlR7dgMT6Z4n1bwl4j+CnwO8UzSXGr+CfiTpFzot7OctqGhXFrdm1kB7mLmFscDao65r650/wDYo8D2/wAPfH3hq/1XxFrmoeO40i1/xTql8s+rXapgRqJCmxVQcKoTAB6V0vxA/Ze8FfEjx98OfGeppew+IPAkwk0y6tJUQzKNpEc+UO9AVyANpBLYIyaAPjX9lj4b6f4g+N3j3Xrn4DL4untPipq7J8QTq1tD/ZZjuwy/6O0gkfyz8/yqc7uM4Ne1/tL6XB8Zf2svhV8H/FFxOPh9c6Nf+IL7SYp3hj1q5iYLFBKVILJGAZNgOD37Y7Xw1+xfpHg3xvqPiLQviV8RtIh1HX5fEd3oVnrUUemz3MswlkV4RBkxsQFI3ZKjGe9dp8c/2dPC/wAfLbRJNZuNU0XXdCuGutH8RaBdm01DT5GADmKTBGGAAKsCDgcZAoA+f/2jfg54K+C97+z9pngfw3Y+GdPvPi5pV3PbWCFUeX7PMm7GePlRRx6e5rsf2smKfHr9mJgpYjxXeEKOp/0GTitnxD+xhpvjHwPpXh/xD8TfiJrF3pWvx+I7LX59WhGo21ykJiRY5BBtSMBiwAXO4k55NbGi/sn6NYXvg691bxt418XX/hTWptb0+88RapHdS+ZJAIDE7eUMxBQWCjBDMTnnFAHgn7G/wG8BftP/AAkj+MHxS0WDxz478UalezXc+qyPJ/ZqxXUkcVrAm4CJEWNSAAD83pivDfFmuXOt/tH/ABI+GviFb3Q/hH4p+KENv4m8QwfKk8htEa101nBBjSaSL537AryMnP2nN+xN4e0zxhq2ueDvHfjv4dWusXp1DUdD8L6ukGn3FwSC8gieJ9hbHzbCPQYFb2ufsieA/Evhz4paHqf9o3lj8RL8anqnmTJutrhURUe2IT5ChjRhu3cjnI4oA+Zv2mvhPpXww+NOu/EL4kfClPif8EpNHsNOtHsJR5ng2GBdkgjtNy5ickOXTBXHUdD99aPqVprGk2V/p8qz2F1Ak9vKgwrxsoZSPYgivAPG37FunfEPdaa/8UfiTf8Ah65tra11Hw+2txpZ6gsMaR/vVWEMDIIwZNhXcxY8E19BafYW+lWFtZWcKW9pbRLDDDGMLGigBVA9AABQBYooooAKKKKACqWtWk1/o99a20zW9xPBJHHMrlCjFSAwYcggnOR0q7RQB4FcfAj4iXUN2JPijeKZ9MWyCW/nxBJUjISVW81irF0hkY9T+9X7r8dL4o+E3ijWJ9Ml0zxvfaSLOzs7cwmWSRJXhd5JHchlLNI3kqW7ojqVIfA9YooA8p0P4S+ItL0HVYZvGF9c6rdWMdpFcyXVw6x7Z5pGbmTh2SSOIyJtb93uXbwBgP8AA3x1PDGsnxIvEcR+VI8UtyvmZg2B8edhWifDoFwHOfM3ZyPdaKAOO+F/hDWfB2h3FvrmuS67ezzLMZXeR1jIijRgpkZiAzo0mBhQZCAOMnsaKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAP/9k=)">
                </div>
                <!-- header part -->
                <div class="text-center">
                    <h1 class="capitalize" style="padding-left:-15px;">invoice</h1>
                </div>
                </br>
            </div>
            <hr>
            <!-- end header part -->

            <!-- information -->
            <div class="full-width inline-block">
                <div class="half left">
                    <div class="padding_right">
                        <p class="capitalize">store</p>
                        <p><b class="capitalize">name:</b> ONE CLICK(SR) </p>
                        <p><b class="capitalize">address:</b> Siemreap </p>
                        <p><b class="capitalize">phone:</b> 069777566 </p>
                        <p><b class="capitalize">email:</b> admin@theoneclicks.com </p>
                        <p><b class="capitalize">date:</b> 2021-01-23 12:11:40 </p>
                        <p><b class="capitalize">invoice:</b> S13-1000049 </p>
                        <p><b class="capitalize">reference:</b> ................................. </p>
                    </div>

                </div>
                <div class="half right">
                    <div class="padding_right">
                        <p class="capitalize">customer</p>
                        <p><b class="capitalize">name:</b> JBL PoiPet(Daro) </p>
                        <p><b class="capitalize">address:</b> .................................
                        </p>
                        <p><b class="capitalize">phone:</b> 089494793 </p>
                        <p><b class="capitalize">email:</b> ................................. </p>
                        <p><b class="capitalize">payment:</b> completed </p>

                    </div>
                </div>
            </div>

            <p class="capitalize">note: </p>
            <hr>
            <!-- product part -->
            <table align="center" cellpadding="0" cellspacing="0" role="presentation">
                <thead>
                    <tr>
                        <td align="center" class="capitalize">No.</td>
                        <td align="center" class="capitalize">description</td>
                        <td align="center" class="capitalize">quantity</td>
                        <td align="center" class="capitalize">unit price</td>
                        <td align="center" class="capitalize">discount</td>
                        <td align="center" class="capitalize">total</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            BE-GNT-P9828V6
                        </td>
                        <td align="center" valign="top">5</td>
                        <td align="center" valign="top">35</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">175</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            A2-X20RJ-1080P
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">27</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">189</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            Memory Card 32G
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            D2-R1080P
                        </td>
                        <td align="center" valign="top">1</td>
                        <td align="center" valign="top">21</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">21</td>
                    </tr>

                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            BE-GNT-P9828V6
                        </td>
                        <td align="center" valign="top">5</td>
                        <td align="center" valign="top">35</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">175</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            A2-X20RJ-1080P
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">27</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">189</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            Memory Card 32G
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            D2-R1080P
                        </td>
                        <td align="center" valign="top">1</td>
                        <td align="center" valign="top">21</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">21</td>
                    </tr>

                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            BE-GNT-P9828V6
                        </td>
                        <td align="center" valign="top">5</td>
                        <td align="center" valign="top">35</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">175</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            A2-X20RJ-1080P
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">27</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">189</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            Memory Card 32G
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            D2-R1080P
                        </td>
                        <td align="center" valign="top">1</td>
                        <td align="center" valign="top">21</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">21</td>
                    </tr>

                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            BE-GNT-P9828V6
                        </td>
                        <td align="center" valign="top">5</td>
                        <td align="center" valign="top">35</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">175</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            A2-X20RJ-1080P
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">27</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">189</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            Memory Card 32G
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            D2-R1080P
                        </td>
                        <td align="center" valign="top">1</td>
                        <td align="center" valign="top">21</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">21</td>
                    </tr>

                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            BE-GNT-P9828V6
                        </td>
                        <td align="center" valign="top">5</td>
                        <td align="center" valign="top">35</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">175</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            A2-X20RJ-1080P
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">27</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">189</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            Memory Card 32G
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            D2-R1080P
                        </td>
                        <td align="center" valign="top">1</td>
                        <td align="center" valign="top">21</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">21</td>
                    </tr>

                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            BE-GNT-P9828V6
                        </td>
                        <td align="center" valign="top">5</td>
                        <td align="center" valign="top">35</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">175</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            A2-X20RJ-1080P
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">27</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">189</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            Memory Card 32G
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            D2-R1080P
                        </td>
                        <td align="center" valign="top">1</td>
                        <td align="center" valign="top">21</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">21</td>
                    </tr>

                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            BE-GNT-P9828V6
                        </td>
                        <td align="center" valign="top">5</td>
                        <td align="center" valign="top">35</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">175</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            A2-X20RJ-1080P
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">27</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">189</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            Memory Card 32G
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            D2-R1080P
                        </td>
                        <td align="center" valign="top">1</td>
                        <td align="center" valign="top">21</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">21</td>
                    </tr>


                </tbody>

                <tbody>
                    <tr>
                        <td colspan="5" align="right" class="capitalize">total price (US Dollar) </td>
                        <td rowspan="1" align="center">\$ 385.00</td>
                    </tr>
                    <tr>
                        <td colspan="5" align="right" class="capitalize">total price (KHMER Riel) </td>
                        <td rowspan="1" align="center">៛ 1559250.00</td>
                    </tr>
                    <tr>
                        <td colspan="5" align="right" class="capitalize">discount ( 0% )</td>
                        <td rowspan="1" align="center">\$ 0.00</td>
                    </tr>
                    <tr>
                        <td colspan="5" align="right" class="capitalize">vat ( 0% )</td>
                        <td rowspan="1" align="center">\$ 0.00</td>
                    </tr>
                    <tr>
                        <td colspan="5" align="right" class="capitalize">paid</td>
                        <td rowspan="1" align="center">\$ 385.00</td>
                    </tr>
                    <tr>
                        <td colspan="5" align="right" class="capitalize">due</td>
                        <td rowspan="1" align="center">\$ 0.00</td>
                    </tr>
                </tbody>

            </table>

            </hr>
            </br>

            <div class="text-center">Thank you for shopping with us. Please come again</div>
            </br>
            </br>

            <div class="text-center">Published by MYLEKHA on 2021-03-26 20:49:15. Current timezone is Asia/Phnom_Penh </div>
        </div>
    </div>

</body>

</html>
   """;
  }

  static String getReceiptContent() {
    return """
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RECEIPT</title>
</head>
    
    <style>
        * {
          padding: 0px;
          margin: 0px;
        }
        
        body,
        p {
            margin: 0px;
            padding: 0px;
             -webkit-font-smoothing: none;
            font-smooth: never;
            font-family: Arial;
            font-size: 12px;
        }
        
        body {
            width: 250px;
        }
        
        hr {
            border-top: 1px dashed black;
        }
        
        .text-center {
            text-align: center;
        }
        
        .text-left {
            text-align: left;
        }
        
        .text-right {
            text-align: left;
        }
        
        .text-justify {
            text-align: justify;
        }
        
        .right {
            float: right;
        }
        
        .left {
            float: left;
        }
        
        .total {
            font-size: 1.5em;
            margin: 5px;
        }
        
        a {
            color: #000;
        }
        
        span {
            color: #000;
        }
        
        .full-width {
            width: 100%;
        }
        
        .inline-block {
            display: inline-block;
        }
    </style>
    
    <body>
    
        <div class="receipt">
            <div class="container">
                <!-- header part -->
                <div class="text-center">
                    <p>MYLEKHA STORE</p>
                    <hr>
                    <p class="total">320.00</p>
                    <span>Total</span>
                </div>
                <hr>
                <!-- end header part -->
    
                <p>Cashier: owner</p>
                <p>POS: POS 1</p>
                <hr>
                <!-- product part -->
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
    
                <p class="full-width inline-block">
                    <b class="left">Item c1 p2</b>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
    
                <p class="full-width inline-block">
                    <strong class="left">Item c1 p2</strong>
                    <b class="right">4.00</b>
                </p>
                <p><span>2 x 2.00</span></p>
                <p><span>+egg (0.60)</span></p>
                <p><span>+rice (3.00)</span></p>
                <hr>
                <!-- end product part -->
    
                <!-- footer part -->
                <p class="full-width inline-block">
                    <b class="left">Total</b>
                    <b class="right">4.00</b>
                </p>
                <p class="full-width inline-block">
                    <b class="left">Cash</b>
                    <b class="right">4.00</b>
                </p>
            </div>
            <hr>
            <!-- end footer part -->
            <div class="container">
                <p class="full-width inline-block">
                    <span class="left">01/09/2020 22:23</span>
                    <span class="right">No 3-10001</span>
                </p>
            </div>
    
        </div>
        <div class="container text-center">
            <br>
            <p>@2020 <a href="https://mylekha.app">MYLEKHA</a>. All right reserved.</p>
        </div>
    </body>
  </html>
  """;
  }

  static String getShortReceiptContent() {
    return """
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RECEIPT</title>
</head>

<style>  
    * {
      margin: 0px;
      padding: 0px;
    }
 
    body,
    p {
        -webkit-font-smoothing: none;
        font-smooth: never;
        font-family: Verdana;
        font-size: 12px;
    }

    body {
        width: 250px;
    }
    
    .receipt {
        background: white;
    }
   
    
    hr {
        border-top: 1px dashed black;
    }
    
    .text-center {
        text-align: center;
    }
    
    .text-left {
        text-align: left;
    }
    
    .text-right {
        text-align: left;
    }
    
    .text-justify {
        text-align: justify;
    }
    
    .right {
        float: right;
    }
    
    .left {
        float: left;
    }
    
    .total {
        font-size: 1.5em;
        margin: 5px;
    }
    
    a {
        color: #000;
    }
    
    span {
        color: #000;
    }
    
    .full-width {
        width: 100%;
    }
    
    .inline-block {
        display: inline-block;
    }
    
    .box {
      padding: 20px;
      margin-bottom: 20px;
    }
    
    .border-box-1 {
      border: 1px solid #000;
      border-radius: 6px;
    }
    
    .border-box-2 {
      border: 5px solid #000;
    }
    
    .table {
      margin-bottom: 20px;
    }
    
    .table table {
      width: 100%;
      
      border: 2px solid #000;
    }
    
    .table table td {
      border: 2px solid #000;
      text-align: center;
    }
</style>

<body>

    <div class="receipt">
        <div class="container">
            <div class="text-center">
                <p>MYLEKHA STORE</p>
                <hr>
                <p class="total">320.00</p>
                <span>Total</span>
            </div>
            <hr>
            <!-- end header part -->
            <p>Cashier: owner</p>
            <p>POS: POS 1</p>
            <hr>
            <!-- product part -->
            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00 \$</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00 €</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>


            <hr>
            <!-- end product part -->

            <!-- footer part -->
            <p class="full-width inline-block">
                <b class="left">Total</b>
                <b class="right">4.00 ₩</b>
            </p>
            <p class="full-width inline-block">
                <b class="left">Cash</b>
                <b class="right">4.00 ₽</b>
            </p>
        </div>
        <hr>
        <!-- end footer part -->
        <div class="container">
            <p class="full-width inline-block">
                <span class="left">01/09/2020 22:23</span>
                <span class="right">No 3-10001</span>
            </p>
        </div>

    </div>
</body>

</html>  
  """;
  }

  static String getTicketReceiptContent() {
    return """
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RECEIPT</title>
  </head>

  <style>
    * {
      padding: 0px;
      margin: 0px;
    }
  
    body {
       width: 250px;
       font-size: 12px;
    }
    
    #ticket img {
      filter: grayscale(100%);
      display: block;
      width: 100%;
      height: 0px;
      padding-top: 25%;

      background: url(../images/logo_1.png) center center no-repeat;
      background-size: cover;
    }

    #ticket u {
      min-width: 100%;
      display: inline-block;
      border-bottom: 1px solid #cdcdcd;
      text-decoration: none;
    }

    #ticket i {
      font-style: italic;
    }

    #ticket b {
      font-weight: bold;
    }

    #ticket t {
      display: inline-block;
      width: 30px;
    }

    #ticket line {
      width: 100%;

      display: block;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: clip;
      line-height: 1;
      height: 10px;
    }

    #ticket line:after {
      font-size: 14;
      content: attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol)
        attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol)
        attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol)
        attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol)
        attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol)
        attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol)
        attr(symbol) attr(symbol);
    }

    #ticket line[type="single"]:after {
      font-size: 14;
      content: "────────────────────────────────────────────────────────────────────────";
    }

    #ticket line[type="double"]:after {
      font-size: 14;
      content: "════════════════════════════════════════════════════════════════════════";
    }

    #ticket label {
      display: block;
      text-align: left;
    }

    #ticket label[align="left"] {
      text-align: left;
    }

    #ticket label[align="center"] {
      text-align: center;
    }

    #ticket label[align="right"] {
      text-align: right;
    }

    #ticket inv {
      display: contents;
    }

    #ticket inv * {
      background-color: #000;
      color: #fff;
    }

    #ticket cell {
      flex: 1;
      display: block;
      width: 100%;
      box-sizing: border-box;

      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }

    #ticket row {
      display: flex;
      flex-direction: row;
      width: 100%;
    }

    #ticket center {
      text-align: center;
    }

    #ticket left {
      text-align: left;
    }

    #ticket right {
      text-align: right;
    }

    #ticket inv center {
      display: block;
      width: fit-content;
      margin: 0 auto;
    }

    #ticket inv left {
      display: block;
      width: fit-content;
    }

    #ticket inv right {
      display: block;
      width: fit-content;
      margin: 0 0 0 auto;
    }

    #ticket cell[width] {
      flex: none;
      width: calc(6px * var(--x));
    }

    #ticket cell[align="right"] {
      text-align: right;
    }

    #ticket cell[align="left"] {
      text-align: left;
    }

    #ticket cell[align="center"] {
      text-align: center;
    }

    #ticket s {
      display: contents;
      font-size: 100%;
    }

    #ticket sh {
      display: inline-block;
      font-size: 200%;
      transform: scale(0.5, 1);
      line-height: 1;
    }

    #ticket w {
      display: inline-block;
      font-size: 200%;
      transform: scale(1, 0.5);
      line-height: 1;
    }

    #ticket wh {
      display: contents;
      font-size: 200%;
    }

    #ticket fs[size="1"] {
      font-size: 100%;
    }

    #ticket fs[size="2"] {
      font-size: 24px;
    }

    #ticket fs[size="3"] {
      font-size: 34px;
    }

    #ticket fs[size="4"] {
      font-size: 44px;
    }

    #ticket fs[size="5"] {
      font-size: 54px;
    }

    #ticket fs[size="6"] {
      font-size: 64px;
    }

    #ticket fs[size="7"] {
      font-size: 74px;
    }

    #ticket fs[size="8"] {
      font-size: 84px;
    }

    #ticket fs[size="9"] {
      font-size: 94px;
    }

    #ticket qr {
      display: inline-block;
      width: 20px;
      height: 20px;

      background: url(../images/qr_code.jpg) center center no-repeat;
      background-size: 100% 100%;
    }

    #ticket qr[size="1"] {
      width: 30px;
      height: 30px;
    }

    #ticket qr[size="2"] {
      width: 40px;
      height: 40px;
    }

    #ticket qr[size="3"] {
      width: 50px;
      height: 50px;
    }

    #ticket qr[size="4"] {
      width: 60px;
      height: 60px;
    }

    #ticket qr[size="5"] {
      width: 70px;
      height: 70px;
    }

    #ticket qr[size="6"] {
      width: 80px;
      height: 80px;
    }

    #ticket qr[size="7"] {
      width: 90px;
      height: 90px;
    }

    #ticket qr[size="8"] {
      width: 100px;
      height: 100px;
    }

    #ticket bar {
      display: inline-block;
      background: #fff url(../images/bar_ean_13.jpg) center center no-repeat;
      background-size: 100% 100%;
    }

    #ticket bar[width="2"] {
      width: 40%;
    }

    #ticket bar[width="3"] {
      width: 60%;
    }

    #ticket bar[width="4"] {
      width: 80%;
    }

    #ticket bar[width="5"] {
      width: 90%;
    }

    #ticket bar[width="6"] {
      width: 100%;
    }

    #ticket bar[height] {
      flex: none;
      height: calc(0.6px * var(--h));
    }

    #ticket bar[type="1"] {
      background-image: url(../images/bar_upc_a.jpg);
    }

    #ticket bar[type="2"] {
      background-image: url(../images/bar_upc_e.jpg);
    }

    #ticket bar[type="3"] {
      background-image: url(../images/bar_ean_13.jpg);
    }

    #ticket bar[type="4"] {
      background-image: url(../images/bar_ean_8.jpg);
    }

    #ticket bar[type="5"] {
      background-image: url(../images/bar_code_39.jpg);
    }

    #ticket bar[type="6"] {
      background-image: url(../images/bar_itf.jpg);
    }

    #ticket bar[type="7"] {
      background-image: url(../images/bar_nw7.jpg);
    }

    #ticket bar[type="8"] {
      background-image: url(../images/bar_code_93.jpg);
    }

    #ticket bar[type="9"] {
      background-image: url(../images/bar_code_128.jpg);
    }

    #ticket euro:after {
      content: "€";
      display: inline;
    }

    /* ------- padding left -------- */
    cell[pleft="1"] {
      padding-left: calc(6px * 1);
    }

    cell[pleft="2"] {
      padding-left: calc(6px * 2);
    }

    cell[pleft="3"] {
      padding-left: calc(6px * 3);
    }

    cell[pleft="4"] {
      padding-left: calc(6px * 4);
    }

    cell[pleft="5"] {
      padding-left: calc(6px * 5);
    }

    cell[pleft="6"] {
      padding-left: calc(6px * 6);
    }

    cell[pleft="7"] {
      padding-left: calc(6px * 7);
    }

    cell[pleft="8"] {
      padding-left: calc(6px * 8);
    }

    cell[pleft="9"] {
      padding-left: calc(6px * 9);
    }

    cell[pleft="10"] {
      padding-left: calc(6px * 10);
    }

    /* ------- padding right -------- */

    cell[pright="1"] {
      padding-right: 6px;
    }

    cell[pright="2"] {
      padding-right: 16px;
    }

    cell[pright="3"] {
      padding-right: 24px;
    }

    cell[pright="4"] {
      padding-right: 32px;
    }

    cell[pright="5"] {
      padding-right: 40px;
    }

    cell[pright="6"] {
      padding-right: 46px;
    }

    cell[pright="7"] {
      padding-right: 56px;
    }

    cell[pright="8"] {
      padding-right: 64px;
    }

    cell[pright="9"] {
      padding-right: 72px;
    }

    cell[pright="10"] {
      padding-right: 80px;
    }
  </style>

  <body>
    <div id="ticket" class="Preview_ticket__2NReU">
      <b>
        <row>
          <cell align="left"></cell>
        </row>
      </b>

      <b>
        <row>
          <cell align="left"></cell>
        </row>
      </b>

      <b>
        <row>
          <cell align="left">CARDHOLDER COPY</cell>
        </row>
      </b>

      <br />

      <row>
        <cell align="left">Date</cell>

        <cell align="right">01/03/2023</cell>
      </row>

      <row>
        <cell align="left">Time</cell>

        <cell align="right">16:48:43</cell>
      </row>

      <br />

      <row>
        <cell align="left">Card</cell>

        <cell align="right">****9999</cell>
      </row>

      <row>
        <cell align="left">PAN seq.</cell>

        <cell align="right">33</cell>
      </row>

      <row>
        <cell align="left">Pref. name</cell>

        <cell align="right">mc en gbr gbp</cell>
      </row>

      <row>
        <cell align="left">Card type</cell>

        <cell align="right">mc</cell>
      </row>

      <row>
        <cell align="left">Payment method</cell>

        <cell align="right">mc</cell>
      </row>

      <row>
        <cell align="left">Payment variant</cell>

        <cell align="right">mc</cell>
      </row>

      <row>
        <cell align="left">Entry mode</cell>

        <cell align="right">Contactless chip</cell>
      </row>

      <br />

      <row>
        <cell align="left">AID</cell>

        <cell align="right">A000000004101001</cell>
      </row>

      <row>
        <cell align="left">MID</cell>

        <cell align="right">50</cell>
      </row>

      <row>
        <cell align="left">TID</cell>

        <cell align="right">P400Plus-803441018</cell>
      </row>

      <row>
        <cell align="left">PTID</cell>

        <cell align="right">62021267</cell>
      </row>

      <br />

      <row>
        <cell align="left">Auth. code</cell>

        <cell align="right">123456</cell>
      </row>

      <row>
        <cell align="left">Tender</cell>

        <cell align="right">CEZ1001677685723009</cell>
      </row>

      <row>
        <cell align="left">Reference</cell>

        <cell align="right">UNT-POS:PCPASCAL-2743-3130</cell>
      </row>

      <br />

      <row>
        <cell align="left">Type</cell>

        <cell align="right">GOODS_SERVICES</cell>
      </row>

      <b>
        <row>
          <cell align="left">TOTAL</cell>

          <cell align="right">€ 6,00</cell>
        </row>
      </b>

      <br />

      <b>
        <row>
          <cell align="left">APPROVED</cell>
        </row>
      </b>

      <br />

      <row>
        <cell align="left">Retain for your records</cell>
      </row>

      <row>
        <cell align="left">Thank you</cell>
      </row>

      <cut></cut>

      <b>
        <row>
          <cell align="left"></cell>
        </row>
      </b>

      <b>
        <row>
          <cell align="left"></cell>
        </row>
      </b>

      <b>
        <row>
          <cell align="left">KOPIE WINKELIER</cell>
        </row>
      </b>

      <br />

      <row>
        <cell align="left">Datum</cell>

        <cell align="right">01/03/2023</cell>
      </row>

      <row>
        <cell align="left">Tijd</cell>

        <cell align="right">16:48:43</cell>
      </row>

      <br />

      <row>
        <cell align="left">Kaart</cell>

        <cell align="right">****9999</cell>
      </row>

      <row>
        <cell align="left">PAN seq.</cell>

        <cell align="right">33</cell>
      </row>

      <row>
        <cell align="left">Gewenste naam</cell>

        <cell align="right">mc en gbr gbp</cell>
      </row>

      <row>
        <cell align="left">Kaarttype</cell>

        <cell align="right">mc</cell>
      </row>

      <row>
        <cell align="left">Betalingsmethode</cell>

        <cell align="right">mc</cell>
      </row>

      <row>
        <cell align="left">Payment variant</cell>

        <cell align="right">mc</cell>
      </row>

      <row>
        <cell align="left">Invoermodus</cell>

        <cell align="right">Contactloze chip</cell>
      </row>

      <br />

      <row>
        <cell align="left">AID</cell>

        <cell align="right">A000000004101001</cell>
      </row>

      <row>
        <cell align="left">MID</cell>

        <cell align="right">50</cell>
      </row>

      <row>
        <cell align="left">TID</cell>

        <cell align="right">P400Plus-803441018</cell>
      </row>

      <row>
        <cell align="left">PTID</cell>

        <cell align="right">62021267</cell>
      </row>

      <br />

      <row>
        <cell align="left">Auth. code</cell>

        <cell align="right">123456</cell>
      </row>

      <row>
        <cell align="left">Tender</cell>

        <cell align="right">CEZ1001677685723009</cell>
      </row>

      <row>
        <cell align="left">Referentie</cell>

        <cell align="right">UNT-POS:PCPASCAL-2743-3130</cell>
      </row>

      <br />

      <row>
        <cell align="left">Type</cell>

        <cell align="right">GOEDEREN_SERVICES</cell>
      </row>

      <b>
        <row>
          <cell align="left">Totaal</cell>
          <cell align="right">€ 6,00</cell>
        </row>
      </b>
      <br />
      <b>
        <row>
          <cell align="left">AKKOORD</cell>
        </row>
      </b>
      <br />
    </div>
  </body>
</html>

""";
  }

  static String getComplexTicketReceiptContent() {
    return """
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RECEIPT</title>
  </head>

  <style>
    * {
      padding: 0px;
      margin: 0px;
    }
    
    body {
       width: 250px;
       font-size: 12px;
    }
    
    #ticket {
      background-color: #fff;
    }
    
    #ticket img {
      filter: grayscale(100%);
      display: block;
      width: 100%;
      height: 0px;
      padding-top: 25%;

      background: url(../images/logo_1.png) center center no-repeat;
      background-size: cover;
    }

    #ticket u {
      min-width: 100%;
      display: inline-block;
      border-bottom: 1px solid #cdcdcd;
      text-decoration: none;
    }

    #ticket i {
      font-style: italic;
    }

    #ticket b {
      font-weight: bold;
    }

    #ticket t {
      display: inline-block;
      width: 30px;
    }

    #ticket line {
      width: 100%;

      display: block;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: clip;
      line-height: 1;
      height: 10px;
    }

    #ticket line:after {
      font-size: 14;
      content: attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol)
        attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol)
        attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol)
        attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol)
        attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol)
        attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol) attr(symbol)
        attr(symbol) attr(symbol);
    }

    #ticket line[type="single"]:after {
      font-size: 14;
      content: "────────────────────────────────────────────────────────────────────────";
    }

    #ticket line[type="double"]:after {
      font-size: 14;
      content: "════════════════════════════════════════════════════════════════════════";
    }

    #ticket label {
      display: block;
      text-align: left;
    }

    #ticket label[align="left"] {
      text-align: left;
    }

    #ticket label[align="center"] {
      text-align: center;
    }

    #ticket label[align="right"] {
      text-align: right;
    }

    #ticket inv {
      display: contents;
    }

    #ticket inv * {
      background-color: #000;
      color: #fff;
    }

    #ticket cell {
      flex: 1;
      display: block;
      width: 100%;
      box-sizing: border-box;

      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }

    #ticket row {
      display: flex;
      flex-direction: row;
      width: 100%;
    }

    #ticket center {
      text-align: center;
    }

    #ticket left {
      text-align: left;
    }

    #ticket right {
      text-align: right;
    }

    #ticket inv center {
      display: block;
      width: fit-content;
      margin: 0 auto;
    }

    #ticket inv left {
      display: block;
      width: fit-content;
    }

    #ticket inv right {
      display: block;
      width: fit-content;
      margin: 0 0 0 auto;
    }

    #ticket cell[width] {
      flex: none;
      width: calc(6px * var(--x));
    }

    #ticket cell[align="right"] {
      text-align: right;
    }

    #ticket cell[align="left"] {
      text-align: left;
    }

    #ticket cell[align="center"] {
      text-align: center;
    }

    #ticket s {
      display: contents;
      font-size: 100%;
    }

    #ticket sh {
      display: inline-block;
      font-size: 200%;
      transform: scale(0.5, 1);
      line-height: 1;
    }

    #ticket w {
      display: inline-block;
      font-size: 200%;
      transform: scale(1, 0.5);
      line-height: 1;
    }

    #ticket wh {
      display: contents;
      font-size: 200%;
    }

    #ticket fs[size="1"] {
      font-size: 100%;
    }

    #ticket fs[size="2"] {
      font-size: 24px;
    }

    #ticket fs[size="3"] {
      font-size: 34px;
    }

    #ticket fs[size="4"] {
      font-size: 44px;
    }

    #ticket fs[size="5"] {
      font-size: 54px;
    }

    #ticket fs[size="6"] {
      font-size: 64px;
    }

    #ticket fs[size="7"] {
      font-size: 74px;
    }

    #ticket fs[size="8"] {
      font-size: 84px;
    }

    #ticket fs[size="9"] {
      font-size: 94px;
    }

    #ticket qr {
      display: inline-block;
      width: 20px;
      height: 20px;

      background: url(../images/qr_code.jpg) center center no-repeat;
      background-size: 100% 100%;
    }

    #ticket qr[size="1"] {
      width: 30px;
      height: 30px;
    }

    #ticket qr[size="2"] {
      width: 40px;
      height: 40px;
    }

    #ticket qr[size="3"] {
      width: 50px;
      height: 50px;
    }

    #ticket qr[size="4"] {
      width: 60px;
      height: 60px;
    }

    #ticket qr[size="5"] {
      width: 70px;
      height: 70px;
    }

    #ticket qr[size="6"] {
      width: 80px;
      height: 80px;
    }

    #ticket qr[size="7"] {
      width: 90px;
      height: 90px;
    }

    #ticket qr[size="8"] {
      width: 100px;
      height: 100px;
    }

    #ticket bar {
      display: inline-block;
      background: #fff url(../images/bar_ean_13.jpg) center center no-repeat;
      background-size: 100% 100%;
    }

    #ticket bar[width="2"] {
      width: 40%;
    }

    #ticket bar[width="3"] {
      width: 60%;
    }

    #ticket bar[width="4"] {
      width: 80%;
    }

    #ticket bar[width="5"] {
      width: 90%;
    }

    #ticket bar[width="6"] {
      width: 100%;
    }

    #ticket bar[height] {
      flex: none;
      height: calc(0.6px * var(--h));
    }

    #ticket bar[type="1"] {
      background-image: url(../images/bar_upc_a.jpg);
    }

    #ticket bar[type="2"] {
      background-image: url(../images/bar_upc_e.jpg);
    }

    #ticket bar[type="3"] {
      background-image: url(../images/bar_ean_13.jpg);
    }

    #ticket bar[type="4"] {
      background-image: url(../images/bar_ean_8.jpg);
    }

    #ticket bar[type="5"] {
      background-image: url(../images/bar_code_39.jpg);
    }

    #ticket bar[type="6"] {
      background-image: url(../images/bar_itf.jpg);
    }

    #ticket bar[type="7"] {
      background-image: url(../images/bar_nw7.jpg);
    }

    #ticket bar[type="8"] {
      background-image: url(../images/bar_code_93.jpg);
    }

    #ticket bar[type="9"] {
      background-image: url(../images/bar_code_128.jpg);
    }

    #ticket euro:after {
      content: "€";
      display: inline;
    }

    /* ------- padding left -------- */
    cell[pleft="1"] {
      padding-left: calc(6px * 1);
    }

    cell[pleft="2"] {
      padding-left: calc(6px * 2);
    }

    cell[pleft="3"] {
      padding-left: calc(6px * 3);
    }

    cell[pleft="4"] {
      padding-left: calc(6px * 4);
    }

    cell[pleft="5"] {
      padding-left: calc(6px * 5);
    }

    cell[pleft="6"] {
      padding-left: calc(6px * 6);
    }

    cell[pleft="7"] {
      padding-left: calc(6px * 7);
    }

    cell[pleft="8"] {
      padding-left: calc(6px * 8);
    }

    cell[pleft="9"] {
      padding-left: calc(6px * 9);
    }

    cell[pleft="10"] {
      padding-left: calc(6px * 10);
    }

    /* ------- padding right -------- */

    cell[pright="1"] {
      padding-right: 6px;
    }

    cell[pright="2"] {
      padding-right: 16px;
    }

    cell[pright="3"] {
      padding-right: 24px;
    }

    cell[pright="4"] {
      padding-right: 32px;
    }

    cell[pright="5"] {
      padding-right: 40px;
    }

    cell[pright="6"] {
      padding-right: 46px;
    }

    cell[pright="7"] {
      padding-right: 56px;
    }

    cell[pright="8"] {
      padding-right: 64px;
    }

    cell[pright="9"] {
      padding-right: 72px;
    }

    cell[pright="10"] {
      padding-right: 80px;
    }
    
    [width='1'] {
        --x: 1;
    }
    
    [width='2'] {
        --x: 2;
    }
    
    [width='3'] {
        --x: 3;
    }
    
    [width='4'] {
        --x: 4;
    }
    
    [width='5'] {
        --x: 5;
    }
    
    [width='6'] {
        --x: 6;
    }
    
    [width='7'] {
        --x: 7;
    }
    
    [width='8'] {
        --x: 8;
    }
    
    [width='9'] {
        --x: 9;
    }
    
    [width='10'] {
        --x: 10;
    }
    
    [width='11'] {
        --x: 11;
    }
    
    [width='12'] {
        --x: 12;
    }
    
    [width='13'] {
        --x: 13;
    }
    
    [width='14'] {
        --x: 14;
    }
    
    [width='15'] {
        --x: 15;
    }
    
    [width='16'] {
        --x: 16;
    }
    
    [width='17'] {
        --x: 17;
    }
    
    [width='18'] {
        --x: 18;
    }
    
    [width='19'] {
        --x: 19;
    }
    
    [width='20'] {
        --x: 20;
    }
    
    [width='21'] {
        --x: 21;
    }
    
    [width='22'] {
        --x: 22;
    }
    
    [width='23'] {
        --x: 23;
    }
    
    [width='24'] {
        --x: 24;
    }
    
    [width='25'] {
        --x: 25;
    }
  </style>

  <body>
    <div id="ticket">
      <center><sh>TOA TOA Bar Geladaria</sh></center>
      <center><b>OLIMPIO NUNES CONSTANTINO</b></center>
      <center>RUA FERNANDO QUARESMA LOJA 1B</center>
      <center>FOZ DO ARELHO</center>
      <center>2500-486 FOZ DO ARELHO</center>
      <center>NIF: PT 204005051</center>
      <line type="single"></line>
        <row>
          <cell><b>FACTURA SIMPLIFICADA</b></cell>
          <cell align="right">Original</cell>
        </row>
        <row>
          <cell><b>FS 0101B.FS/86198</b></cell>
          <cell align="right">Fatura liquidada</cell>
        </row>
        <row>
          <cell width="16">Data:2023-02-02</cell>
          <cell width="10">Hora:13:49</cell>
          <cell align="right">Op:Vendedor 1</cell>
        </row>
      <line type="single"></line>
      <row>
        <cell width="12">Cliente:</cell>
        <cell>Consumidor final</cell>
      </row>
      <row>
        <cell width="12">Contrib.:</cell>
        <cell>PT   Consumidor Final</cell>
      </row>
      <line type="single"></line>
      <row>
        <cell width="4"><b>Qt</b></cell>
        <cell><b>Descriacao</b></cell>
        <cell width="5"><b>Prc</b></cell>
        <cell width="5"><b>Dsc</b></cell>
        <cell width="4"><b>IVA</b></cell>
        <cell width="6"><b>Total</b></cell>
      </row>
      <line type="single"></line>
      <row>
        <cell width="4">1</cell>
        <cell>CERVEJA MEDIA</cell>
        <cell width="5">1.20</cell>
        <cell width="6">0.00%</cell>
        <cell width="4">23%</cell>
        <cell width="6" align="right">1.20</cell>
      </row>
      <row>
        <cell width="4">1</cell>
        <cell>AGUA 0.50L</cell>
        <cell width="5">1.00</cell>
        <cell width="6">0.00%</cell>
        <cell width="4">13%</cell>
        <cell width="6" align="right">1.00</cell>
      </row>
      
      <line type="single" pleft="18"></line>
      
      <row>
        <cell width="18">Pagamento em:</cell>
        <cell>Total Iva.inc</cell>
        <cell align="right" width="8">2.20</cell>
      </row>
      
      <row>
        <cell width="10">Dinheiro:</cell>
        <cell width="8" align="right" pright="1">2,20</cell>
        <cell>Dsc.Global</cell>
        <cell width="6">0.00%</cell>
        <cell align="right" width="6">2.20</cell>
      </row>
      <row>
        <cell width="10">Troco:</cell>
        <cell width="8" align="right" pright="1">2,20</cell>
        <cell><b>Total Doc.</b></cell>
        <cell align="right"><b>2.20</b></cell>
      </row>
      <line type="single"></line>
      
      <row>
        <cell width="8" align="right"><b>Taxa</b></cell>
        <cell width="16" align="right"><b>Incidencia</b></cell>
        <cell pright="1" align="right"><b>Valor IVA</b></cell>
      </row>
      
      <row>
        <cell width="8" align="right">13%</cell>
        <cell width="16" align="right">0,88</cell>
        <cell pright="1" align="right">0,12</cell>
      </row>
      <row>
        <cell width="8" align="right">23%</cell>
        <cell width="16" align="right">0,98</cell>
        <cell pright="1" align="right">0,22</cell>
      </row>
      
      <row>
        <cell width="8" align="right"><b>Totais</b></cell>
        <cell width="16" align="right"><b>1,86</b></cell>
        <cell pright="1" align="right"><b>0,34</b></cell>
      </row>
      
      <br>
      
      <center>Os artigos facturados/sevicos prestados foram colocados a disposicao do adquirente na data 02-02-2023 (№ 5, Alinea f) do artigo 36 do CIVA)</center>
      <br>
      <br>
      <center><b>IUD: FS 0101B.FC /86198</b></center>
      <center><b>ATCUD: JF5MB9DK - 86198</b></center>
      
      <br>
      <br>
      <br>
    </div>
  </body>
</html>

""";
  }

  static String getTestTicketContent() {
    return """
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    
    <style>   
    
    * {
      padding: 0px;
      margin: 0px;
    }
    
    body,
    p {
        margin: 0px;
        padding: 0px;
         -webkit-font-smoothing: none;
        font-smooth: never;
        font-family: Arial;
    }
    
    body {
        background: #eee;
        width: 250px;
    }
    
    .receipt {
        max-width: 302.36px;
        margin: auto;
        background: white;
    }
    
    .container {
        padding: 5px 15px;
    }
    
    hr {
        border-top: 1px dashed black;
    }
    
    .box {
      padding: 20px;
      margin-bottom: 20px;
    }
    
    .border-box-1 {
      border: 1px solid #000;
      border-radius: 6px;
    }
    
    .border-box-2 {
      border: 5px solid #000;
    }
    
    .table {
      margin-bottom: 20px;
    }
    
    .table table {
      width: 100%;
      
      border: 2px solid #000;
    }
    
    .table table td {
      border: 2px solid #000;
      text-align: center;
    }
</style>

<body>
    <div class="receipt">
        <div class="container">
            <!-- header part -->
            <div class="text-center">
                <p>TEST PRINT</p>
                <hr>
            </div>
            <hr>
            <!-- end header part -->
            <div style="font-size: 20px;">Test text 20 px</div>
            <br />
            <div class="border-box-1 box">
              <div style="font-size: 16px;">Test text 18</div>
              <div style="font-size: 16px;">Test text 16</div>
              <div style="font-size: 14px;">Test text 14</div>
            </div>
            <div class="border-box-2 box">
              <div style="font-size: 12px;">Test text 12</div>
              <div style="font-size: 10px;">Test text 10</div>
              <div style="font-size: 6px;">Test text 8</div>
            </div>
            <div class="table">
              <table>
                <tr>
                  <td>1</td>
                  <td>2</td>
                  <td>3</td>
                </tr>
                <tr>
                  <td>4</td>
                  <td>5</td>
                  <td>6</td>
                </tr>
              </table>
            </div>
        </div>
    </body>
</html>  
    """;
  }
}
