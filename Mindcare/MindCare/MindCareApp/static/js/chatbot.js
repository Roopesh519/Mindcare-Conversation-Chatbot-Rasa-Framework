let imageUrl;
let chatBlock = $('.chat-content');
let index = 0;
let ChatInput = $('#chat_input');
let submitButton = $('#send_button');
let voice_input = $('#voice_input');

$(document).ready(function () {
    imageUrl = $('#imageUrl').val();

    submitButton.prop("disabled", true);

    const StartText = "Hi There, How are you?";
    chatBlock.append(responseContainer(index));
    appendResText(index, StartText);
    index++;

    ChatInput.on("input", function () {
        $.trim($(this).val()) != "" ? submitButton.prop("disabled", false) : submitButton.prop("disabled", true);
    });

    $('#chatInput').submit(function (event) {
        event.preventDefault();
        var chatData = new FormData(this);
        let data = Object.fromEntries(chatData);

        chatbot(data, index);
        submitButton.prop('disabled', true);
        index++;
    });

    ChatInput.on("keypress", function (event) {
        // Check if the pressed key is Enter (key code 13)
        if (event.which === 13) {
            if (ChatInput.val().length > 0) {
                $("#chatInput").submit();
                event.preventDefault();
            }
        }
    });

    voice_input.on("click", function () {
        ChatInput.val(null);
        submitButton.prop("disabled", true)
        navigator.mediaDevices.getUserMedia({ audio: true })
            .then(function (stream) {
                const recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition)();

                recognition.lang = 'en-US';
                recognition.start();
                ChatInput.attr('placeholder', 'Recognizing ...');

                recognition.onresult = function (event) {
                    ChatInput.attr('placeholder', 'Message ...');
                    const transcript = event.results[0][0].transcript;
                    ChatInput.val(transcript);
                    $.trim(transcript) != "" ? submitButton.prop("disabled", false) : submitButton.prop("disabled", true);

                };

                recognition.onend = function () {
                    ChatInput.attr('placeholder', 'Message ...');
                    stream.getTracks().forEach(track => track.stop()); // Stop the microphone stream
                };
            })
            .catch(function (error) {
                console.error('Error accessing microphone:', error);
                alert('Please grant microphone permissions to use this feature.');
            });
    });


});


const chatbot = (data, index) => {
    const request = requestContent(data.chat_input);
    var response = responseContainer(index);
    var inputValue = $.trim(data.chat_input);

    if (inputValue != "") {
        chatBlock.append(request);
        ChatInput.val('');
        chatBlock.append(response);
        sendRequest(data, index);
        scrollToBottom();
    }
}

const sendRequest = (formData, index) => {
    PostRequest(chatRequestApiUrl, formData,
        (response) => {
            if (response.length > 1) {
                const emotion = response[1].custom.emotion;
                const linkButton = document.createElement("a");
                linkButton.href = `/music?type=${emotion}`; // Set the link URL
                linkButton.textContent = "Click Here"; // Set the link text
                linkButton.classList.add("link-button"); // Add any additional classes if needed
                appendResText(index, response[0].text, true, linkButton);
                activity(emotion);
                // const text = response[1].text;
                // switch (text) {
                //     case 'sad':
                //         break;
                //     case 'happy':
                //         break;
                //     default:
                //         break;
                // }
            } else {
                appendResText(index, response[0].text);
            }
        },
    );
}

const requestContent = (content) => {
    var request = `
    <div class="pe-2 ms-5 mb-3 d-flex justify-content-end align-items-start request">
        <div class="card d-inline-block p-3 bg-light ms-5">
            ${content}
        </div>
        <div class="ms-1">
        <img src=${imageUrl} alt="User Avatar" class="object-fit-fill bg-light rounded-circle border border-2 p-1 me-2" width="40" height="40">
    </div>
    </div>
`;

    return request;
}

const responseContainer = (index) => {
    var response = `
    <div class="pe-2 me-5 mb-4 d-flex    align-items-start response">
    <div>
        <img src="/media/Common/mindu.png" alt="Chatbot Avatar"
            class="object-fit-fill rounded-circle  border border-1 me-2 " width="40" height="40">
    </div>
    <div class="card d-inline-block p-3  justify-content-start bg-info-subtle  response-text-`+ index + `"> 
    <div class="spinner-grow spinner-grow-sm" role="status">
    </div>
    </div>
    </div>`;

    return response;
}


const typeText = (element, text, index, speed, callback) => {
    if (index < text.length) {
        $(element).append(text[index]);
        index++;
        setTimeout(function () {
            typeText(element, text, index, speed, callback);
        }, speed);
    } else {
        // Typing is complete, invoke the callback
        callback();
    }
    scrollToBottom();
};

const appendResText = (index, content, link = false, linkButton = null) => {
    $(`.response-text-${index} .spinner-grow`).remove();
    typeText(".response .response-text-" + index, content, 0, 20, () => {
        // Callback function, called when typing is complete
        if (link) {
            $(`.response-text-${index}`).append('<br>');
            // Create a link button and append it after typing the text
            $(`.response-text-${index}`).append(linkButton);
        }
    });
};

const scrollToBottom = () => {
    var container = $(".scroll");
    container.scrollTop(container.prop("scrollHeight"));
}

const activity = (query) => {
    const params = { 'type': query };

    GetRequest(search_activityUrl, (response) => {
        $('#activity_block').empty();
        if (response.length > 0) {
            $('.chat-content').append("");

            let res = `<div class="row"><div class="">Do some activities based on your mood</div>`;

            response.forEach(data => {
                res += `
                <div class="col-12 col-md-4 col-lg-4 py-2">
                  <div class="card rounded-3 shadow">
                    <div class="opacity-50">
                        <img src="/media/${data.image}" class="card-img object-fit-cover" alt="type" height="200">
                    </div>
                    <div class="card-img-overlay">
                        <h5 class="card-title text-center mt-4 text-dark">${data.activity_name}</h5>
                        <div class="text-center">
                            <a type="link" class="btn btn-info px-5 mt-5 text-center"
                                href="/startActivity?type=${data.type}">Start</a>
                        </div>
                    </div>
                   </div>
                </div>`;
            });
            res += `</div>`;

            $('.chat-content').append(res);

        } else {
            var img = $('<img>').attr({
                'src': '/media/Activity/pexels-charles-1851164.jpg',
                'alt': 'not found',
                'width': 100,
                'height': 300,
                'class': 'object-fit-contain mb-2 '
            });

            $('.chat-content').append(img);
        }

    }, true, params);
}


//actuall code is below ----------------------------------------------------------


// let imageUrl;
// let chatBlock = $('.chat-content');
// let index = 0;
// let ChatInput = $('#chat_input');
// let submitButton = $('#send_button');
// let voice_input = $('#voice_input');

// $(document).ready(function () {
//     imageUrl = $('#imageUrl').val();

//     submitButton.prop("disabled", true);

//     const StartText = "Hi There, How are you?";
//     chatBlock.append(responseContainer(index));
//     appendResText(index, StartText);
//     index++;

//     ChatInput.on("input", function () {
//         $.trim($(this).val()) != "" ? submitButton.prop("disabled", false) : submitButton.prop("disabled", true);
//     });

//     $('#chatInput').submit(function (event) {
//         event.preventDefault();
//         var chatData = new FormData(this);
//         let data = Object.fromEntries(chatData);

//         chatbot(data, index);
//         submitButton.prop('disabled', true);
//         index++;
//     });

//     ChatInput.on("keypress", function (event) {
//         // Check if the pressed key is Enter (key code 13)
//         if (event.which === 13) {
//             if (ChatInput.val().length > 0) {
//                 $("#chatInput").submit();
//                 event.preventDefault();
//             }
//         }
//     });

//     voice_input.on("click", function () {
//         ChatInput.val(null);
//         submitButton.prop("disabled", true)
//         navigator.mediaDevices.getUserMedia({ audio: true })
//             .then(function (stream) {
//                 const recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition)();

//                 recognition.lang = 'en-US';
//                 recognition.start();
//                 ChatInput.attr('placeholder', 'Recognizing ...');

//                 recognition.onresult = function (event) {
//                     ChatInput.attr('placeholder', 'Message ...');
//                     const transcript = event.results[0][0].transcript;
//                     ChatInput.val(transcript);
//                     $.trim(transcript) != "" ? submitButton.prop("disabled", false) : submitButton.prop("disabled", true);

//                 };

//                 recognition.onend = function () {
//                     ChatInput.attr('placeholder', 'Message ...');
//                     stream.getTracks().forEach(track => track.stop()); // Stop the microphone stream
//                 };
//             })
//             .catch(function (error) {
//                 console.error('Error accessing microphone:', error);
//                 alert('Please grant microphone permissions to use this feature.');
//             });
//     });
// });

// const chatbot = (data, index) => {
//     const request = requestContent(data.chat_input);
//     var response = responseContainer(index);
//     var inputValue = $.trim(data.chat_input);

//     if (inputValue != "") {
//         chatBlock.append(request);
//         ChatInput.val('');
//         chatBlock.append(response);
//         sendRequest(data, index);
//         scrollToBottom();
//     }
// }

// const sendRequest = (formData, index) => {
//     PostRequest(chatRequestApiUrl, formData,
//         (response) => {
//             if (response.length > 1) {
//                 const emotion = response[1].custom.emotion;
//                 const linkButton = document.createElement("a");
//                 linkButton.href = `/music?type=${emotion}`;
//                 linkButton.textContent = "Click Here";
//                 linkButton.classList.add("link-button");
//                 // Append the translated response text
//                 appendTranslatedResText(index, response[0].text, true, linkButton);
//                 activity(emotion);
//             } else {
//                 // Append the translated response text
//                 appendTranslatedResText(index, response[0].text);
//             }
//         },
//     );
// }

// const requestContent = (content) => {
//     var request = `
//     <div class="pe-2 ms-5 mb-3 d-flex justify-content-end align-items-start request">
//         <div class="card d-inline-block p-3 bg-light ms-5">
//             ${content}
//         </div>
//         <div class="ms-1">
//         <img src=${imageUrl} alt="User Avatar" class="object-fit-fill bg-light rounded-circle border border-2 p-1 me-2" width="40" height="40">
//     </div>
//     </div>
// `;

//     return request;
// }

// const responseContainer = (index) => {
//     var response = `
//     <div class="pe-2 me-5 mb-4 d-flex    align-items-start response">
//     <div>
//         <img src="/media/Common/mindu.png" alt="Chatbot Avatar"
//             class="object-fit-fill rounded-circle  border border-1 me-2 " width="40" height="40">
//     </div>
//     <div class="card d-inline-block p-3  justify-content-start bg-info-subtle  response-text-`+ index + `"> 
//     <div class="spinner-grow spinner-grow-sm" role="status">
//     </div>
//     </div>
//     </div>`;

//     return response;
// }

// const typeText = (element, text, index, speed, callback) => {
//     if (index < text.length) {
//         $(element).append(text[index]);
//         index++;
//         setTimeout(function () {
//             typeText(element, text, index, speed, callback);
//         }, speed);
//     } else {
//         // Typing is complete, invoke the callback
//         callback();
//     }
//     scrollToBottom();
// };

// const appendTranslatedResText = (index, content, link = false, linkButton = null) => {
//     $(`.response-text-${index} .spinner-grow`).remove();

//     // Translate the response text to Kannada
//     translateText(content, 'kn').done((response) => {
//         const translatedText = response.data.translations[0].translatedText;

//         // Typing out the translated text
//         typeText(".response .response-text-" + index, translatedText, 0, 20, () => {
//             // Callback function, called when typing is complete
//             if (link) {
//                 $(`.response-text-${index}`).append('<br>');
//                 // Create a link button and append it after typing the text
//                 $(`.response-text-${index}`).append(linkButton);
//             }
//         });
//     }).fail((error) => {
//         console.error('Translation Error:', error);
//         // If translation fails, append the original English text
//         typeText(".response .response-text-" + index, content, 0, 20, () => {
//             // Callback function, called when typing is complete
//             if (link) {
//                 $(`.response-text-${index}`).append('<br>');
//                 // Create a link button and append it after typing the text
//                 $(`.response-text-${index}`).append(linkButton);
//             }
//         });
//     });
// };

// const translateText = (text, targetLanguage) => {
//     const apiKey = 'AIzaSyD0-6B79eGrUriMF-L_6fUW5f44YGFKe6A';
//     const apiUrl = `https://translation.googleapis.com/language/translate/v2?key=${apiKey}`;

//     const requestData = {
//         q: text,
//         target: targetLanguage,
//     };

//     return $.ajax({
//         url: apiUrl,
//         type: 'POST',
//         contentType: 'application/json',
//         data: JSON.stringify(requestData),
//     });
// };

// const scrollToBottom = () => {
//     var container = $(".scroll");
//     container.scrollTop(container.prop("scrollHeight"));
// }

// const activity = (query) => {
//     const params = { 'type': query };

//     GetRequest(search_activityUrl, (response) => {
//         $('#activity_block').empty();
//         if (response.length > 0) {
//             $('.chat-content').append("");

//             let res = `<div class="row"><div class="">Do some activities based on your mood</div>`;

//             response.forEach(data => {
//                 res += `
//                 <div class="col-12 col-md-4 col-lg-4 py-2">
//                   <div class="card rounded-3 shadow">
//                     <div class="opacity-50">
//                         <img src="/media/${data.image}" class="card-img object-fit-cover" alt="type" height="200">
//                     </div>
//                     <div class="card-img-overlay">
//                         <h5 class="card-title text-center mt-4 text-dark">${data.activity_name}</h5>
//                         <div class="text-center">
//                             <a type="link" class="btn btn-info px-5 mt-5 text-center"
//                                 href="/startActivity?type=${data.type}">Start</a>
//                         </div>
//                     </div>
//                    </div>
//                 </div>`;
//             });
//             res += `</div>`;

//             $('.chat-content').append(res);

//         } else {
//             var img = $('<img>').attr({
//                 'src': '/media/Activity/pexels-charles-1851164.jpg',
//                 'alt': 'not found',
//                 'width': 100,
//                 'height': 300,
//                 'class': 'object-fit-contain mb-2 '
//             });

//             $('.chat-content').append(img);
//         }

//     }, true, params);
// }
