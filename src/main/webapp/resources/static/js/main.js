$(document).ready(function(){
    // 레이어 팝업창
    $(".car-state-memo-btn, .inputBtn").click(function(){
        $(".dark").addClass("active");
        $(".modalWrap").addClass("active");
        return false;
    });
    $(".dark, .popUpClose, .searchCal, .searchSave").click(function(){
        $(".dark").removeClass("active");
        $(".modalWrap").removeClass("active");
        return false;
    });
    // sent_list.html userDateArea
    $(".contractCompletion").click(function(){
        $(".contractCompletion").addClass("active");
        $(".contractNCompletion").removeClass("active");
        return false;
    });
    $(".contractNCompletion").click(function(){
        $(".contractNCompletion").addClass("active");
        $(".contractCompletion").removeClass("active");
        return false;
    });
    // superBtn
    $(".superBtn30").click(function(){
        $(".superBtn30").addClass("active");
        $(".superBtn50").removeClass("active");
        return false;
    });
    $(".superBtn50").click(function(){
        $(".superBtn50").addClass("active");
        $(".superBtn30").removeClass("active");
        return false;
    });
    // 보험대차
    $(".localTab .tab-box").click(function(){
        var $index = $(this).index();

        $(".localTab .tab-box").removeClass("active");
        $(".localTab .tab-box").eq($index).addClass("active");
        //$("#insuranceListTap > li").removeClass("active");
        //$("#insuranceListTap > li").eq($index).addClass("active");
    });

    if( $(".date-picker").length || $("#datepicker_start").length ){
        $.datepicker.setDefaults({
            closeText: '닫기',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년',
            dateFormat: 'yy-mm-dd',


        });

        $('#datepicker_start').datepicker();
        $('#datepicker_start').datepicker("option", "maxDate", $("#datepicker_end").val());
        $('#datepicker_start').datepicker("option", "onClose", function ( selectedDate ) {
            $("#datepicker_end").datepicker( "option", "minDate", selectedDate );
        });

        $('#datepicker_end').datepicker();
        $('#datepicker_end').datepicker("option", "minDate", $("#datepicker_start").val());
        $('#datepicker_end').datepicker("option", "onClose", function ( selectedDate ) {
            $("#datepicker_start").datepicker( "option", "maxDate", selectedDate );
        });



        $('.date-picker').each(function(){
            $(this).datepicker();
        })

        $(".btn-date").on('click', function() {
            $(this).prev('.input-date').datepicker('show');
        })

    }






    if($("[data-toggle='tooltip']").length) {

        $("[data-toggle='tooltip']").tooltipster({
            animation: 'fade',
            trigger: 'hover',

            delay: 200,
            maxWidth: 360,
            theme: 'tooltipster-light',
            touchDevices: false,
            interactive: true,
            position: 'bottom',
            functionPosition: function(instance, helper, position){
                position.coord.top += 0;
                position.coord.left += 0;
                return position;
            }
        });
    }

});


$(window).on('load', function() {

    $(".CommonSearchHeader_tab_wrap__x_JP9 > .CommonSearchHeader_tab__2_JEE").on('click', function() {
        $(this).siblings().removeClass('CommonSearchHeader_on__3DlSn');
        $(this).addClass('CommonSearchHeader_on__3DlSn');

        if(!$("[data-contract-status='billingComplete']").hasClass('CommonSearchHeader_on__3DlSn')) {
            $("[data-contract-fillter='faxStatus']").css('display', 'none');
        } else{
            $("[data-contract-fillter='faxStatus']").css('display', 'inherit');
        }
        if(!$("[data-contract-status='all']").hasClass('CommonSearchHeader_on__3DlSn')) {
            $("[title='period_option']").css('display', 'none');
        } else {
            $("[title='period_option']").css('display', 'inherit');
        }


    })

    $(".CarModalContentStyle_select_car_modal_wrap__2zd6C tr").on('click', function(e) {

        $(this).find(".CarModalContentStyle_checkbox_div__1qWHz").removeClass("CarModalContentStyle_inactive_checkbox__XWwAH")

        if( !$(this).find(".CarModalContentStyle_checkbox_div__1qWHz").hasClass("CarModalContentStyle_active_checkbox__1_fpI") ) {
            $(this).find(".CarModalContentStyle_checkbox_div__1qWHz").addClass("CarModalContentStyle_active_checkbox__1_fpI");
        } else {
            $(this).find(".CarModalContentStyle_checkbox_div__1qWHz").removeClass("CarModalContentStyle_active_checkbox__1_fpI");
            $(this).find(".CarModalContentStyle_checkbox_div__1qWHz").addClass("CarModalContentStyle_inactive_checkbox__XWwAH");
        }

        $(this).siblings().find(".CarModalContentStyle_checkbox_div__1qWHz").addClass("CarModalContentStyle_inactive_checkbox__XWwAH");
        $(this).siblings().find(".CarModalContentStyle_checkbox_div__1qWHz").removeClass("CarModalContentStyle_active_checkbox__1_fpI");

    })

    $(".PartnerModalContentStyle_table_area__1mXs2 tr").on('click', function(e) {

        $(this).find(".PartnerModalContentStyle_checkbox_div__2vMG4").removeClass("PartnerModalContentStyle_inactive_checkbox__3CHa6")
        $(this).find(".PartnerModalContentStyle_checkbox_div__2vMG4").addClass("PartnerModalContentStyle_active_checkbox__25yVN");
        $(this).siblings().find(".PartnerModalContentStyle_checkbox_div__2vMG4").addClass("PartnerModalContentStyle_inactive_checkbox__3CHa6");
        $(this).siblings().find(".PartnerModalContentStyle_checkbox_div__2vMG4").removeClass("PartnerModalContentStyle_active_checkbox__25yVN");

    })


})




function currentMenu() {

    var link = document.location.href,
        linkSplit = link.split('//')[1].split('/'),
        linkArrLast = linkSplit.pop();

    var menuAnchor = document.querySelector('.side-menu-wrap [href$="'+ linkArrLast +'"]');
    //alert(menuAnchor);
    if(menuAnchor) {
        menuAnchor.classList.add('on');
        menuAnchor.parentElement.parentElement.parentElement.className = 'open-menu';
        menuAnchor.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.classList.add('open');
    }

    var parentPath = linkSplit[linkSplit.length - 1],
        menuParentPath = document.querySelector('.side-menu-wrap [href*="'+ parentPath +'"]');

    if(menuParentPath && parentPath !== 'html') {

        menuParentPath.parentElement.parentElement.parentElement.className = 'open-menu';
        menuParentPath.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.classList.add('open');
    }

}
var carouselWrap = document.querySelector('.banner-image-wrap');

if(carouselWrap) {
    var slider = tns({
        container: '.banner-image-wrap',
        items: 1,
        slideBy: 'page',
        autoplay: true,
        "mouseDrag": true,
        "swipeAngle": false
    });
}

window.onload = function() {

    currentMenu();

    var mainMenus = document.querySelectorAll('.menu-item-container');
    if(mainMenus){
        for( var i=0; i< mainMenus.length; i++ ) {

            var menus = mainMenus[i];
            menus.addEventListener('click', function(el) {

                var mainMenuTit = document.querySelectorAll('.menu-item-title');

                if(this.classList.contains('menu-item-title')) {

                    for(var j = 0 ; j < mainMenuTit.length; j++) {
                        mainMenuTit[j].parentElement.nextElementSibling.className = 'close-menu';
                        mainMenuTit[j].classList.remove('open');
                    }

                    this.classList.add('open');
                    this.parentElement.nextElementSibling.className = 'open-menu';
                } else {
                    mainMenus.forEach(function(menu){
                        menu.firstElementChild.classList.remove('on');
                    })

                    this.firstElementChild.classList.add('on');

                }
            })
        }
    }

    // modal show / hide
    var modalTriggers = document.querySelectorAll('.modal-trigger');
    //const modalClose = document.querySelector(".modal-close");


    modalTriggers.forEach(trigger => {
        trigger.addEventListener('click', () => {
            var modalTrigger = trigger.dataset.modalTrigger;

            var modal = document.querySelector("[data-modal='" + modalTrigger + "']");

            modal.style.display = 'block';

        })
    })


    function hideModal(button) {
        var modalWrap = button.closest("[data-modal]");
        var modalTit = modalWrap.dataset.modal;
        modalWrap.style.display = 'none';

        if( modalTit == "searchAddress" ){
            modalWrap.querySelector("#find_address_wrap").style.display = '';
            //modal.querySelector("#modalAddress").value = '';
            modalWrap.querySelector("#modalDetailAddress").value = '';
            modalWrap.querySelector("#detail_address_wrap").style.display = 'none';
        }
    }

    var btnHideModal = document.querySelectorAll(".modal-hide, .modal-close");

    btnHideModal.forEach(function(btn) {
        btn.addEventListener('click', function(el) {
            hideModal(this);
        })
    })


    var choiceItem = document.querySelectorAll('.modal-choice-item');

    if(choiceItem) {
        for(i=0; i<choiceItem.length; i++) {
            choiceItem[i].addEventListener('click', function(item) {
                //choiceItem[i].querySelector

            })
        }

    }

}
// 제 2운전자 체크
function checkedSecondDrive(){
    var secondDrive = document.getElementById('secondDriveChk');
    if(!secondDrive.checked) {
        document.querySelector('.form-second-drive').style.display = 'none';
    } else{
        document.querySelector('.form-second-drive').style.display = 'block';
    }

}

function joinInsurance() {
    if(document.getElementById("insurance_on").checked) {
        document.querySelector('#insuranceYN').style.display = '';
    } else if (document.getElementById("insurance_off").checked){
        document.querySelector('#insuranceYN').style.display = 'none';
    }
}
// 상세 보기 기본정보 수정
function modifyInfoTable(button) {

    button.style.display = 'none'
    button.parentElement.querySelector('.btn-cancel').style.display = '';
    button.parentElement.querySelector('.btn-save').style.display = '';

    //var infoTable = document.querySelector('.info-table');
    var infoTable = button.closest('.info-table-container').querySelector('.info-table');
    var outputArea = infoTable.querySelectorAll('.output-area');
    var inputArea = infoTable.querySelectorAll('.input-area');
    var modifyNone = infoTable.querySelectorAll('.modify-none');

    for(i = 0; i < outputArea.length; i++) {
        outputArea[i].style.display = 'none';
    }
    inputArea.forEach(function(input) {
        input.style.display = '';
    })

    if(modifyNone) {
        modifyNone.forEach(function(container) {
            container.style.display = 'none'
        })
    }

}
// 상세 보기 기본정보 수정 취소
function cancelInfoTable(button) {

    button.style.display = 'none'

    button.parentElement.querySelector('.btn-save').style.display = 'none';
    button.parentElement.querySelector('.btn-modification').style.display = '';

    //var infoTable = document.querySelector('.info-table');
    var infoTable = button.closest('.info-table-container').querySelector('.info-table');
    var outputArea = infoTable.querySelectorAll('.output-area');
    var inputArea = infoTable.querySelectorAll('.input-area');
    var modifyNone = infoTable.querySelectorAll('.modify-none');

    for(i = 0; i < outputArea.length; i++) {
        outputArea[i].style.display = '';

    }
    inputArea.forEach(function(input) {
        input.style.display = 'none';
    })
    if(modifyNone) {
        modifyNone.forEach(function(container) {
            container.style.display = ''
        })
    }


}


function inputChoiceContract(button, form) {

    form = button.closest('.form-choice');

    if(form) {

        form.style.display = 'none';
        form.closest('.input-area').querySelector(".form-directly").style.display = '';
        form.closest('.input-area').querySelectorAll(".form-directly input").forEach(function(input){
            input.value = '';
        })
    } else {

        form = button.closest('.form-directly');
        form.style.display = 'none';
        form.closest('.input-area').querySelector(".form-choice").style.display = '';
        //form.closest('.input-area').querySelector(".form-choice input").checked = true;
    }

}

// 납부스케줄 수정
function modifyScheduleInfo(el, mod) {



    var modifyInput = document.querySelectorAll('table .date-picker, .advance-payment, .estimated-payment');
    if(modifyInput) {
        modifyInput.forEach(function(input) {
            input.disabled = !mod;
        })
    }



    var thisContainer = el.closest('.payment-schedule-table-container');
    var modifyArea = document.querySelectorAll("[data-toggle='modify']")

    if(mod) {

        thisContainer.querySelector('.modify-group').style.display = 'none';
        thisContainer.querySelector('.save-group').style.display = '';


        if(modifyArea) {
            modifyArea.forEach(function(area) {
                area.style.display = 'none'
            })
        }

    } else {

        thisContainer.querySelector('.modify-group').style.display = '';
        thisContainer.querySelector('.save-group').style.display = 'none';

        if(modifyArea) {
            modifyArea.forEach(function(area) {
                area.style.display = ''
            })
        }

    }


}

// 주소 API 불러오기
function searchAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("driverAddress").value = extraAddr;

            } else {
                document.getElementById("driverAddress").value = '';
            }

            document.getElementById("driverAddress").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("find_address_wrap").style.display = 'none';
            document.getElementById("modalAddress").value = addr;
            document.getElementById("detail_address_wrap").style.display = '';


        },

    }).embed(document.querySelector('#find_address_wrap'));

}

// 상세 주소 저장
function inputDetailAddress(button, input) {

    var detailAddressWrap = button.closest("#detail_address_wrap");
    var detailAddressInput =  detailAddressWrap.querySelector("#modalDetailAddress");
    var detailAddressVal = detailAddressInput.value;
    alert(detailAddressVal);
    return document.querySelector(input).value += ' ' + detailAddressVal;
}


function selectRentType(type) {

    var getType = document.querySelectorAll("[name='" + type + "']");
    var rentForm = document.querySelectorAll('.form-rent-type');


    getType.forEach(function(select) {
        select.addEventListener('input', function() {

            if(this.checked){
                rentForm.forEach(form => {form.style.display = 'none'})
                document.getElementById("rent_" + select.getAttribute('value')).style.display ='';
                document.getElementById("rent_" + select.getAttribute('value')).reset();
            }
        })
    })


}

selectRentType('rent_type');


// input file 업로드
function uploadFile() {

    var inputFiles = document.querySelectorAll("#uploadFileList input[type='file']");

    for( var file of inputFiles) {

        file.addEventListener('change', function() {


            fileName = getFileInfo(this, 'all');
            var fileWrap = document.createElement('div');
            fileWrap.innerText = fileName;
            var fileDel = document.createElement('div');
            fileDel.className = 'FileRowTable_file_delete__3_FRW';
            fileDel.setAttribute("onclick", "deleteFile(this)");

            file.nextElementSibling.remove();
            file.parentNode.appendChild(fileWrap)
            file.parentNode.appendChild(fileDel)


            var tableWrap = document.querySelector('#uploadFileList');

            var emptyWrap = document.createElement('div');
            emptyWrap.className = "FileRowTable_row_wrap__2KK9C";

            var emptyHtml = '';

            emptyHtml += '    <div class="FileRowTable_row__10ebh">';
            emptyHtml += '        <div class="FileRowTable_label__2lfJQ">';
            emptyHtml += '            <div class="FileRowTable_label_group__z7V3j">';
            emptyHtml += '                <p class="FileRowTable_label_text__NkJNf">첨부파일' + (inputFiles.length + 1) + '</p>';
            emptyHtml += '            </div>';
            emptyHtml += '        </div>';
            emptyHtml += '        <div class="FileRowTable_input_area__1WxnS" style="width:100%">';
            emptyHtml += '            <input type="file" accept="image/*, application/pdf" hidden="" name="file_' + inputFiles.length + '">';
            emptyHtml += '            <div>';
            emptyHtml += '                <div style="color:#c5c0bc;">PDF, JPG, PNG, BPM, GIF 파일로 업로드 주세요.<br>';
            emptyHtml += '(최대 10MB, 5개까지 첨부 가능)</div>';
            emptyHtml += '            </div>';
            emptyHtml += '        </div>';
            emptyHtml += '    </div>';


            emptyWrap.innerHTML = emptyHtml;
            tableWrap.appendChild(emptyWrap);


        })

    }
}

// input file open
function openFileInput(name) {

    var inputFile = document.querySelectorAll("[name*=file_]");
    var idx = inputFile.length;

    document.querySelector("[name='" + name + "_" + (idx-1) + "']").click();

    uploadFile();

}


// file delete
function deleteFile(btn) {

    btn.closest('.FileRowTable_row_wrap__2KK9C').remove(); // 파일 목록 제거

    var inputFiles = document.querySelectorAll("[name*=file_]");

    for(var i = 0; i < inputFiles.length; i++) {

        document.querySelectorAll(".FileRowTable_label_text__NkJNf")[i].innerText = '첨부파일' + (i+1);
        inputFiles[i].setAttribute('name', 'file_' + i );

    }


}


// 파일명 가쟈오기
function getFileInfo(obj,stype) {
    var fileObj, pathHeader , pathMiddle, pathEnd, allFilename, fileName, extName;
    if(obj == "[object HTMLInputElement]") {
        fileObj = obj.value
    } else {
        fileObj = document.getElementById(obj).value;
    }
    if (fileObj != "") {
        pathHeader = fileObj.lastIndexOf("\\");
        pathMiddle = fileObj.lastIndexOf(".");
        pathEnd = fileObj.length;
        fileName = fileObj.substring(pathHeader+1, pathMiddle);
        extName = fileObj.substring(pathMiddle+1, pathEnd);
        allFilename = fileName+"."+extName;

        if(stype == "all") {
            return allFilename; // 확장자 포함 파일명
        } else if(stype == "name") {
            return fileName; // 순수 파일명만(확장자 제외)
        } else if(stype == "ext") {
            return extName; // 확장자
        } else {
            return fileName; // 순수 파일명만(확장자 제외)
        }
    } else {
        alert("파일을 선택해주세요");
        return false;
    }
}


// 인증번호 타이머

var timer;
var isRunning = false;

function sendAuthNum() {
    // 남은시간
    var leftTime = 179,
        frame = document.querySelector('.timer');

    if (isRunning) {
        clearInterval(timer);
    }

    startTimer(leftTime, frame);
}

function startTimer(count, object) {
    var minutes, seconds;
    timer = setInterval(function() {
        minutes = parseInt(count / 60, 10);
        seconds = parseInt(count % 60, 10);
        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;
        object.textContent = minutes + ":" + seconds;

        // 타이머 끝
        if (--count < 0) {
            clearInterval(timer);
            object.textContent = "";
            isRunning = false;
        }
    }, 1000);
}

function hideCertification(button) {

    var buttonParent = button.closest('#phoneNumForm');
    var certificationContainer = buttonParent.nextElementSibling;

    if( !button.disabled ) {
        certificationContainer.querySelector('#timer').innerText = '03:00';
        clearInterval(timer);

        certificationContainer.style.display = 'none';

        //button = buttonParent.querySelector('#certificationBtn');
        button.removeAttribute('onclick');
        button.innerText = '인증';
        button.setAttribute('onclick', 'showCertification(this)');

    }
}


// 휴대폰번호 인증번호 input 영역 show
function showCertification(button) {
    var buttonParent = button.closest('#phoneNumForm');
    var certificationContainer = buttonParent.nextElementSibling;

    //var certificationBtn = document.getElementById('certificationBtn');

    if(!button.disabled) {

        //sendAuthNum();

        // 타이머 시작
        var leftTime = 179,
            frame = certificationContainer.querySelector('#timer')

        if (isRunning) {
            clearInterval(timer);
        }
        startTimer(leftTime, frame);

        certificationContainer.style.display = '';

        button.removeAttribute('onclick');
        button.innerText = '재요청';
        button.setAttribute('onclick', 'hideCertification(this)');

    }

}

function appendHeaderTabs() {

    var tabtab = document.getElementById('tabtab');

    var contractType =  document.querySelector("#contractType .CommonSearchHeader_on__3DlSn")
    var typeName = contractType.innerText;
    var tabHtml = '';
    tabHtml += '<div class="CommonSearchHeader_tab__2_JEE CommonSearchHeader_on__3DlSn">전체</div>';
    tabHtml += '<div class="CommonSearchHeader_tab__2_JEE">배차중</div>';
    if(typeName !== '보험') {
        tabHtml += '<div class="CommonSearchHeader_tab__2_JEE">반납예정</div>';
        tabHtml += '<div class="CommonSearchHeader_tab__2_JEE">입금대기</div>';
    } else {
        tabHtml += '<div class="CommonSearchHeader_tab__2_JEE">청구완료</div>';

    }

    tabtab.innerHTML = tabHtml;
    selectHeaderTab();
}


function selectHeaderTab() {
    var headerTab = document.querySelectorAll('.CommonSearchHeader_tab__2_JEE');

    headerTab.forEach(function(tab) {
        tab.addEventListener('click', function() {
            this.classList.add('CommonSearchHeader_on__3DlSn');

        })
    })
}



