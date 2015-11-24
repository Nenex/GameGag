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
			console.log("===========================================");
			console.log(window.location.protocol + "//"
					+ window.location.host
					+ window.location.pathname);
			console.log("===========================================");

			// "dropzoneForm" is the camel-case version of the form id
			// "dropzone-form"
			Dropzone.options.dropzoneForm = {

				url : window.location.protocol + "//" + window.location.host
						+ "/upload/" + "?target=" + $('#target').val(),
				autoProcessQueue : false,
				uploadMultiple : false,
				maxFilesize : 10, // MB
				parallelUploads : 1,
				maxFiles : 1,
				addRemoveLinks : true,
				previewsContainer : ".dropzone-previews",

				// The setting up of the dropzone
				init : function() {
					
					var myDropzone = this;

					// first set autoProcessQueue = false
					$('#upload-button').on(
							"click",
							function(e) {
							
								var dataForm = $('#form-inf').serialize();
								console.log(dataForm);
								// var id = $("#id_category").val();
								// var title = $("#id_category").val();
								// var description = $("#id_category").val();
								var token = $("input[name='_csrf']").val();
								var header = "X-CSRF-TOKEN";
								console.log("===========================================");
								console.log(window.location.protocol + "//"
										+ window.location.host
										+ window.location.pathname);
								console.log("===========================================");
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
									complete : function(resp) {
										// a voir/
										$("#imgId").val(resp.responseText);
										console.log(resp.responseText);
									}
								});

								myDropzone.processQueue();
							});

					// customizing the default progress bar
					this.on("uploadprogress", function(file, progress) {

						progress = parseFloat(progress).toFixed(0);

						var progressBar = file.previewElement
								.getElementsByClassName("dz-upload")[0];
						progressBar.innerHTML = progress + "%";
					});

					// displaying the uploaded files information in a Bootstrap
					// dialog
					this.on("successmultiple", function(files, serverResponse) {
						showInformationDialog(files, serverResponse);
					});
					this.on("success", function(file) {
						// redirection vert get id xx de romaric
						switch($("#target").val()){
						case "profil":
							window.location.href=window.location.protocol + "//"
							+ window.location.host
							+ window.location.pathname;
								break;
						case "post":
							window.location.href = window.location.protocol + "//" + window.location.host + "/public/post/details/"+$('#imgId').val();
							break;
						default:
							break;
						}
						
					});

					this.on("sending", function(file, xhr, formData) {
						var token = $("input[name='_csrf']").val();
						var header = "X-CSRF-TOKEN";
						xhr.setRequestHeader(header, token);
						console.log(formData);
					});
				}
			}

			function showInformationDialog(files, objectArray) {

				var responseContent = "";

				for (var i = 0; i < objectArray.length; i++) {

					var infoObject = objectArray[i];

					for ( var infoKey in infoObject) {
						if (infoObject.hasOwnProperty(infoKey)) {
							responseContent = responseContent + " " + infoKey
									+ " -> " + infoObject[infoKey] + "<br>";
						}
					}
					responseContent = responseContent + "<hr>";
				}

				// from the library bootstrap-dialog.min.js
				BootstrapDialog.show({
					title : '<b>Server Response</b>',
					message : responseContent
				});
			}

		});