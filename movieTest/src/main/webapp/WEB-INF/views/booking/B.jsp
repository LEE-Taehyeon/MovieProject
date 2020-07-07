<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>B관</title>
<!-- <style>
.seat0{/* 좌석 열 이름 */
height: 30px; width: 30px; display: inline; padding: 10px,auto; color: black;
}
.seat1{/* 일반 좌석 */
height: 30px; width: 30px; display: inline; padding: 10px,auto; background-color: lightgray;
}
.seat2{/* 통로 오른쪽 좌석 */
height: 30px; width: 30px; display: inline; padding: 10px,auto; background-color: lightgray; margin-right: 50px;
}
.seat1_on{/* 선택 좌석 */
height: 30px; width: 30px; display: inline; padding: 10px,auto; background-color: green;
}
.seat1_res{/* 예약 좌석 */
height: 30px; width: 30px; display: inline; padding: 10px,auto; background-color: red; color: black;
}
.seat1_hid{/* 좌석 없는 곳 */
height: 30px; width: 30px; display: inline; padding: 10px,auto; visibility: hidden;
}
</style> -->
</head>
<body>
<div class="A">
<button type="button" class="seat0" title="A" id="A" value="A" disabled="disabled">A</button>
<button type="button" class="seat1 seat1_hid" title="A1" id="A1" value="A1">1</button>
<button type="button" class="seat1 seat2 seat1_hid" title="A2" id="A2" value="A2">2</button>
<button type="button" class="seat1 seat1_hid" title="A3" id="A3" value="A3">3</button>
<button type="button" class="seat1 seat1_hid" title="A4" id="A4" value="A4">4</button>
<button type="button" class="seat1 seat1_hid" title="A5" id="A5" value="A5">5</button>
<button type="button" class="seat1" title="A6" id="A6" value="A6">6</button>
<button type="button" class="seat1" title="A7" id="A7" value="A7">7</button>
<button type="button" class="seat1" title="A8" id="A8" value="A8">8</button>
<button type="button" class="seat1" title="A9" id="A9" value="A9">9</button>
<button type="button" class="seat1" title="A10" id="A10" value="A10">10</button>
<button type="button" class="seat1" title="A11" id="A11" value="A11">11</button>
<button type="button" class="seat1 seat2" title="A12" id="A12" value="A12">12</button>
<button type="button" class="seat1 seat1_hid" title="A13" id="A13" value="A13">13</button>
<button type="button" class="seat1 seat1_hid" title="A14" id="A14" value="A14">14</button>
</div>
<div class="B">
<button type="button" class="seat0" title="B" id="B" value="B" disabled="disabled">B</button>
<button type="button" class="seat1 seat1_hid" title="B1" id="B1" value="B1">1</button>
<button type="button" class="seat1 seat2 seat1_hid" title="B2" id="B2" value="B2">2</button>
<button type="button" class="seat1 seat1_hid" title="B3" id="B3" value="B3">3</button>
<button type="button" class="seat1 seat1_hid" title="B4" id="B4" value="B4">4</button>
<button type="button" class="seat1 seat1_hid" title="B5" id="B5" value="B5">5</button>
<button type="button" class="seat1" title="B6" id="B6" value="B6">6</button>
<button type="button" class="seat1" title="B7" id="B7" value="B7">7</button>
<button type="button" class="seat1" title="B8" id="B8" value="B8">8</button>
<button type="button" class="seat1" title="B9" id="B9" value="B9">9</button>
<button type="button" class="seat1" title="B10" id="B10" value="B10">10</button>
<button type="button" class="seat1" title="B11" id="B11" value="B11">11</button>
<button type="button" class="seat1 seat2" title="B12" id="B12" value="B12">12</button>
<button type="button" class="seat1 seat1_hid" title="B13" id="B13" value="B13">13</button>
<button type="button" class="seat1 seat1_hid" title="B14" id="B14" value="B14">14</button>
</div>
<div class="C">
<button type="button" class="seat0" title="C" id="C" value="C" disabled="disabled">C</button>
<button type="button" class="seat1" title="C1" id="C1" value="C1">1</button>
<button type="button" class="seat1 seat2" title="C2" id="C2" value="C2">2</button>
<button type="button" class="seat1 seat1_hid" title="C3" id="C3" value="C3">3</button>
<button type="button" class="seat1 seat1_hid" title="C4" id="C4" value="C4">4</button>
<button type="button" class="seat1 seat1_hid" title="C5" id="C5" value="C5">5</button>
<button type="button" class="seat1" title="C6" id="C6" value="C6">6</button>
<button type="button" class="seat1" title="C7" id="C7" value="C7">7</button>
<button type="button" class="seat1" title="C8" id="C8" value="C8">8</button>
<button type="button" class="seat1" title="C9" id="C9" value="C9">9</button>
<button type="button" class="seat1" title="C10" id="C10" value="C10">10</button>
<button type="button" class="seat1" title="C11" id="C11" value="C11">11</button>
<button type="button" class="seat1 seat2" title="C12" id="C12" value="C12">12</button>
<button type="button" class="seat1" title="C13" id="C13" value="C13">13</button>
<button type="button" class="seat1" title="C14" id="C14" value="C14">14</button>
</div>
<div class="D">
<button type="button" class="seat0" title="D" id="D" value="D" disabled="disabled">D</button>
<button type="button" class="seat1" title="D1" id="D1" value="D1" name="D1">1</button>
<button type="button" class="seat1 seat2" title="D2" id="D2" value="D2" name="D2">2</button>
<button type="button" class="seat1 seat1_hid" title="D3" id="D3" value="D3">3</button>
<button type="button" class="seat1 seat1_hid" title="D4" id="D4" value="D4">4</button>
<button type="button" class="seat1 seat1_hid" title="D5" id="D5" value="D5">5</button>
<button type="button" class="seat1" title="D6" id="D6" value="D6">6</button>
<button type="button" class="seat1" title="D7" id="D7" value="D7">7</button>
<button type="button" class="seat1" title="D8" id="D8" value="D8">8</button>
<button type="button" class="seat1" title="D9" id="D9" value="D9">9</button>
<button type="button" class="seat1" title="D10" id="D10" value="D10">10</button>
<button type="button" class="seat1" title="D11" id="D11" value="D11">11</button>
<button type="button" class="seat1 seat2" title="D12" id="D12" value="D12">12</button>
<button type="button" class="seat1" title="D13" id="D13" value="D13">13</button>
<button type="button" class="seat1" title="D14" id="D14" value="D14">14</button>
</div>
<div class="E">
<button type="button" class="seat0" title="E" id="E" value="E" disabled="disabled">E</button>
<button type="button" class="seat1" title="E1" id="E1" value="E1">1</button>
<button type="button" class="seat1 seat2" title="E2" id="E2" value="E2">2</button>
<button type="button" class="seat1" title="E3" id="E3" value="E3">3</button>
<button type="button" class="seat1" title="E4" id="E4" value="E4">4</button>
<button type="button" class="seat1" title="E5" id="E5" value="E5">5</button>
<button type="button" class="seat1" title="E6" id="E6" value="E6">6</button>
<button type="button" class="seat1" title="E7" id="E7" value="E7">7</button>
<button type="button" class="seat1" title="E8" id="E8" value="E8">8</button>
<button type="button" class="seat1" title="E9" id="E9" value="E9">9</button>
<button type="button" class="seat1" title="E10" id="E10" value="E10">10</button>
<button type="button" class="seat1" title="E11" id="E11" value="E11">11</button>
<button type="button" class="seat1 seat2" title="E12" id="E12" value="E12">12</button>
<button type="button" class="seat1" title="E13" id="E13" value="E13">13</button>
<button type="button" class="seat1" title="E14" id="E14" value="E14">14</button>
</div>
<div class="F">
<button type="button" class="seat0" title="F" id="F" value="F" disabled="disabled">F</button>
<button type="button" class="seat1" title="F1" id="F1" value="F1">1</button>
<button type="button" class="seat1 seat2" title="F2" id="F2" value="F2">2</button>
<button type="button" class="seat1" title="F3" id="F3" value="F3">3</button>
<button type="button" class="seat1" title="F4" id="F4" value="F4">4</button>
<button type="button" class="seat1" title="F5" id="F5" value="F5">5</button>
<button type="button" class="seat1" title="F6" id="F6" value="F6">6</button>
<button type="button" class="seat1" title="F7" id="F7" value="F7">7</button>
<button type="button" class="seat1" title="F8" id="F8" value="F8">8</button>
<button type="button" class="seat1" title="F9" id="F9" value="F9">9</button>
<button type="button" class="seat1" title="F10" id="F10" value="F10">10</button>
<button type="button" class="seat1" title="F11" id="F11" value="F11">11</button>
<button type="button" class="seat1 seat2" title="F12" id="F12" value="F12">12</button>
<button type="button" class="seat1" title="F13" id="F13" value="F13">13</button>
<button type="button" class="seat1" title="F14" id="F14" value="F14">14</button>
</div>
<div class="G">
<button type="button" class="seat0" title="G" id="G" value="G" disabled="disabled">G</button>
<button type="button" class="seat1" title="G1" id="G1" value="G1" name="G1">1</button>
<button type="button" class="seat1 seat2" title="G2" id="G2" value="G2" name="G2">2</button>
<button type="button" class="seat1" title="G3" id="G3" value="G3">3</button>
<button type="button" class="seat1" title="G4" id="G4" value="G4">4</button>
<button type="button" class="seat1" title="G5" id="G5" value="G5">5</button>
<button type="button" class="seat1" title="G6" id="G6" value="G6">6</button>
<button type="button" class="seat1" title="G7" id="G7" value="G7">7</button>
<button type="button" class="seat1" title="G8" id="G8" value="G8">8</button>
<button type="button" class="seat1" title="G9" id="G9" value="G9">9</button>
<button type="button" class="seat1" title="G10" id="G10" value="G10">10</button>
<button type="button" class="seat1" title="G11" id="G11" value="G11">11</button>
<button type="button" class="seat1 seat2" title="G12" id="G12" value="G12">12</button>
<button type="button" class="seat1" title="G13" id="G13" value="G13">13</button>
<button type="button" class="seat1" title="G14" id="G14" value="G14">14</button>
</div>
<div class="H">
<button type="button" class="seat0 seat1_hid" title="H" id="H" value="H" disabled="disabled">H</button>
<button type="button" class="seat1 seat1_hid" title="H1" id="H1" value="H1">1</button>
<button type="button" class="seat1 seat2 seat1_hid" title="H2" id="H2" value="H2">2</button>
<button type="button" class="seat1 seat1_hid" title="H3" id="H3" value="H3">3</button>
<button type="button" class="seat1 seat1_hid" title="H4" id="H4" value="H4">4</button>
<button type="button" class="seat1 seat1_hid" title="H5" id="H5" value="H5">5</button>
<button type="button" class="seat1 seat1_hid" title="H6" id="H6" value="H6">6</button>
<button type="button" class="seat1 seat1_hid" title="H7" id="H7" value="H7">7</button>
<button type="button" class="seat1 seat1_hid" title="H8" id="H8" value="H8">8</button>
<button type="button" class="seat1 seat1_hid" title="H9" id="H9" value="H9">9</button>
<button type="button" class="seat1 seat1_hid" title="H10" id="H10" value="H10">10</button>
<button type="button" class="seat1 seat1_hid" title="H11" id="H11" value="H11">11</button>
<button type="button" class="seat1 seat2 seat1_hid" title="H12" id="H12" value="H12">12</button>
<button type="button" class="seat1 seat1_hid" title="H13" id="H13" value="H13">13</button>
<button type="button" class="seat1 seat1_hid" title="H14" id="H14" value="H14">14</button>
</div>
<div class="I">
<button type="button" class="seat0" title="I" value="I" id="I" disabled="disabled">I</button>
<button type="button" class="seat1 seat1_hid" title="I1" id="I1" value="I1">1</button>
<button type="button" class="seat1 seat2 seat1_hid" title="I2" id="I2" value="I2">2</button>
<button type="button" class="seat1" title="I3" id="I3" value="I3">3</button>
<button type="button" class="seat1" title="I4" id="I4" value="I4">4</button>
<button type="button" class="seat1" title="I5" id="I5" value="I5">5</button>
<button type="button" class="seat1" title="I6" id="I6" value="I6">6</button>
<button type="button" class="seat1" title="I7" id="I7" value="I7">7</button>
<button type="button" class="seat1" title="I8" id="I8" value="I8">8</button>
<button type="button" class="seat1" title="I9" id="I9" value="I9">9</button>
<button type="button" class="seat1" title="I10" id="I10" value="I10">10</button>
<button type="button" class="seat1" title="I11" id="I11" value="I11">11</button>
<button type="button" class="seat1 seat2" title="I12" id="I12" value="I12">12</button>
<button type="button" class="seat1" title="I13" id="I13" value="I13">13</button>
<button type="button" class="seat1" title="I14" id="I14" value="I14">14</button>
</div>
<div class="J">
<button type="button" class="seat0" title="J" id="J" value="J" disabled="disabled">J</button>
<button type="button" class="seat1 seat1_hid" title="J1" id="J1" value="J1">1</button>
<button type="button" class="seat1 seat2 seat1_hid" title="J2" id="J2" value="J2">2</button>
<button type="button" class="seat1" title="J3" id="J3" value="J3">3</button>
<button type="button" class="seat1" title="J4" id="J4" value="J4">4</button>
<button type="button" class="seat1" title="J5" id="J5" value="J5">5</button>
<button type="button" class="seat1" title="J6" id="J6" value="J6">6</button>
<button type="button" class="seat1" title="J7" id="J7" value="J7">7</button>
<button type="button" class="seat1" title="J8" id="J8" value="J8">8</button>
<button type="button" class="seat1" title="J9" id="J9" value="J9">9</button>
<button type="button" class="seat1" title="J10" id="J10" value="J10">10</button>
<button type="button" class="seat1" title="J11" id="J11" value="J11">11</button>
<button type="button" class="seat1 seat2" title="J12" id="J12" value="J12">12</button>
<button type="button" class="seat1" title="J13" id="J13" value="J13">13</button>
<button type="button" class="seat1" title="J14" id="J14" value="J14">14</button>
</div>
<div class="K">
<button type="button" class="seat0" title="K" id="K" value="K" disabled="disabled">K</button>
<button type="button" class="seat1 seat1_hid" title="K1" id="K"1 value="K1">1</button>
<button type="button" class="seat1 seat2 seat1_hid" title="K2" id="K2" value="K2">2</button>
<button type="button" class="seat1" title="K3" id="K3" value="K3">3</button>
<button type="button" class="seat1" title="K4" id="K4" value="K4">4</button>
<button type="button" class="seat1" title="K5" id="K5" value="K5">5</button>
<button type="button" class="seat1" title="K6" id="K6" value="K6">6</button>
<button type="button" class="seat1" title="K7" id="K7" value="K7">7</button>
<button type="button" class="seat1" title="K8" id="K8" value="K8">8</button>
<button type="button" class="seat1" title="K9" id="K9" value="K9">9</button>
<button type="button" class="seat1" title="K10" id="K10" value="K10">10</button>
<button type="button" class="seat1" title="K11" id="K11" value="K11">11</button>
<button type="button" class="seat1 seat2" title="K12" id="K12" value="K12">12</button>
<button type="button" class="seat1" title="K13" id="K13" value="K13">13</button>
<button type="button" class="seat1" title="K14" id="K14" value="K14">14</button>
</div>
<div class="L">
<button type="button" class="seat0" title="L" id="L" value="L" disabled="disabled">L</button>
<button type="button" class="seat1 seat1_hid" title="L1" id="L1" value="L1">1</button>
<button type="button" class="seat1 seat2 seat1_hid" title="L2" id="L2" value="L2">2</button>
<button type="button" class="seat1" title="L3" id="L3" value="L3">3</button>
<button type="button" class="seat1" title="L4" id="L4" value="L4">4</button>
<button type="button" class="seat1" title="L5" id="L5" value="L5">5</button>
<button type="button" class="seat1" title="L6" id="L6" value="L6">6</button>
<button type="button" class="seat1" title="L7" id="L7" value="L7">7</button>
<button type="button" class="seat1" title="L8" id="L8" value="L8">8</button>
<button type="button" class="seat1" title="L9" id="L9" value="L9">9</button>
<button type="button" class="seat1" title="L10" id="L10" value="L10">10</button>
<button type="button" class="seat1" title="L11" id="L11" value="L11">11</button>
<button type="button" class="seat1 seat2" title="L12" id="L12" value="L12">12</button>
<button type="button" class="seat1" title="L13" id="L13" value="L13">13</button>
<button type="button" class="seat1" title="L14" id="L14" value="L14">14</button>
</div>
<div class="M">
<button type="button" class="seat0" title="M" id="M" value="M" disabled="disabled">M</button>
<button type="button" class="seat1 seat1_hid" title="M1" id="M1" value="M1">1</button>
<button type="button" class="seat1 seat2 seat1_hid" id="M2" title="M2" value="M2">2</button>
<button type="button" class="seat1" title="M3" id="M3" value="M3">3</button>
<button type="button" class="seat1" title="M4" id="M4" value="M4">4</button>
<button type="button" class="seat1" title="M5" id="M5" value="M5">5</button>
<button type="button" class="seat1" title="M6" id="M6" value="M6">6</button>
<button type="button" class="seat1" title="M7" id="M7" value="M7">7</button>
<button type="button" class="seat1" title="M8" id="M8" value="M8">8</button>
<button type="button" class="seat1" title="M9" id="M9" value="M9">9</button>
<button type="button" class="seat1" title="M10" id="M10" value="M10">10</button>
<button type="button" class="seat1" title="M11" id="M11" value="M11">11</button>
<button type="button" class="seat1 seat2" title="M12" id="M12" value="M12">12</button>
<button type="button" class="seat1" title="M13" id="M13" value="M13">13</button>
<button type="button" class="seat1" title="M14" id="M14" value="M14">14</button>
</div>
<div class="N">
<button type="button" class="seat0" title="N" id="N" value="N" disabled="disabled">N</button>
<button type="button" class="seat1 seat1_hid" title="N1" id="N1" value="N1">1</button>
<button type="button" class="seat1 seat2 seat1_hid" title="N2" id="N2" value="N2">2</button>
<button type="button" class="seat1" title="N3" id="N3" value="N3">3</button>
<button type="button" class="seat1" title="N4" id="N4" value="N4">4</button>
<button type="button" class="seat1" title="N5" id="N5" value="N5">5</button>
<button type="button" class="seat1" title="N6" id="N6" value="N6">6</button>
<button type="button" class="seat1" title="N7" id="N7" value="N7">7</button>
<button type="button" class="seat1" title="N8" id="N8" value="N8">8</button>
<button type="button" class="seat1" title="N9" id="N9" value="N9">9</button>
<button type="button" class="seat1" title="N10" id="N10" value="N10">10</button>
<button type="button" class="seat1" title="N11" id="N11" value="N11">11</button>
<button type="button" class="seat1 seat2" title="N12" id="N12" value="N12">12</button>
<button type="button" class="seat1" title="N13" id="N13" value="N13">13</button>
<button type="button" class="seat1" title="N14" id="N14" value="N14">14</button>
</div>
</body>
</html>