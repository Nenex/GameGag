$(document).ready(
		function() {

			$(".file-dropzone").on('dragover', handleDragEnter);
			$(".file-dropzone").on('dragleave', handleDragLeave);
			$(".file-dropzone").on('drop', handleDragLeave);

			function handleDragEnter(e) {

				this.classList.add('drag-over');
			}

			function handleDragLeave(e) {

				this.classList.remove('drag-over');
			}

			// "dropzoneForm" is the camel-case version of the form id
			// "dropzone-form"
			console.log(window.location.protocol + "//" + window.location.host
					+ "/upload/" + "?target=" + $('#target').val());
			Dropzone.options.dropzoneForm = {

				url : window.location.protocol + "//" + window.location.host
						+ "/upload/" + "?target=" + $('#target').val(),
				autoProcessQueue : false,
				uploadMultiple : false,
				maxFilesize : 10, // MB
				parallelUploads : 1,
				maxFiles : 1,
				addRemoveLinks : false,
				previewsContainer : ".dropzone-previews",

				// The setting up of the dropzone
				init : function() {

					var myDropzone = this;

					// first set autoProcessQueue = false
					$('#upload-button').on(
							"click",
							function(e) {
								$('span[id^="error"]').each(function(){
									$(this).html("");
								});
								var dataForm = $('#form-inf').serialize();
								console.log(dataForm);
								var token = $("input[name='_csrf']").val();
								var header = "X-CSRF-TOKEN";
								$.ajax({
									type : "POST",
									url : window.location.protocol + "//"
											+ window.location.host
											+ window.location.pathname,
									data : dataForm,
									async : false,
									dataType : "json",
									mimeType : "application/json",
									headers : {
										header : token,
										"Accept" : "application/json",
										"Cache-Control" : "no-cache",
										"X-Requested-With" : "XMLHttpRequest"
									},
									success : function(resp) {
										// a voir/
										console.log(resp);
										console.log(resp.result);
										if(resp.status=="SUCCESS"){
											
											$("#imgId").val(resp.result);
											if($("#drop-follow").is(":empty")){
												$('#error').html("No modification to save.");
								                $('#error').focus();
											}else{
												myDropzone.processQueue();
											}
										}else if(resp.status=="FAIL"){
											//errorInfo = "";
							                 for(i =0 ; i < resp.result.length ; i++){
							                     //errorInfo += "<br>" + (i + 1) +". " + resp.result[i].code;
							                	 console.log(resp.result[i].field);
							                	 console.log(resp.result[i].code);
							                     $("#error-"+resp.result[i].field).html(resp.result[i].code);
							                 }
										}
									}
								});
							});

					// customizing the default progress bar
					this.on("uploadprogress", function(file, progress) {

						progress = parseFloat(progress).toFixed(0);

						var progressBar = file.previewElement
								.getElementsByClassName("dz-upload")[0];
						progressBar.innerHTML = progress + "%";
					});

					this.on("maxfilesexceeded", function(file) {
						this.removeAllFiles();
						this.addFile(file);
					});
					// displaying the uploaded files information in a
					// Bootstrap
					// dialog
					// this.on("successmultiple", function(files,
					// serverResponse) {
					// // showInformationDialog(files, serverResponse);
					// });
					this.on("success", function(file) {
						switch ($("#target").val()) {
						case "profil":
							window.location.reload()
							break;
						case "post":
							window.location.href = window.location.protocol
									+ "//" + window.location.host
									+ "/public/post/details/"
									+ $('#imgId').val();
							break;
						default:
							break;
						}

					});

					this.on("sending", function(file, xhr, formData) {
						var token = $(".dropzone input[name='_csrf']").val();
						var header = "X-CSRF-TOKEN";
						xhr.setRequestHeader(header, token);
						console.log(formData);
					});
				}
			}

			// function showInformationDialog(files, objectArray) {
			//
			// var responseContent = "";
			//
			// for (var i = 0; i < objectArray.length; i++) {
			//
			// var infoObject = objectArray[i];
			//
			// for ( var infoKey in infoObject) {
			// if (infoObject.hasOwnProperty(infoKey)) {
			// responseContent = responseContent + " "
			// + infoKey + " -> "
			// + infoObject[infoKey] + "<br>";
			// }
			// }
			// responseContent = responseContent + "<hr>";
			// }
			//
			// // from the library bootstrap-dialog.min.js
			// BootstrapDialog.show({
			// title : '<b>Server Response</b>',
			// message : responseContent
			// });
			// }

		});