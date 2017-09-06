/**
 * Created by zc on 2016/12/26.
 */
;(function ($) {
    var defaults = {
            uploadProgress: null,
            beforeSend: null,
            success: null,
        },
        setting = {};

    var upload = function ($this) {
        $this.parent().on('change', $this, function (event) {
            //var $this = $(event.target),
            var formData = new FormData(),
                target = event.target || event.srcElement;
            //$.each(target.files, function(key, value)
            //{
            //    console.log(key);
            //    formData.append(key, value);
            //});
            formData.append('file', target.files[0]);
            formData.append("fileContentType", target.files[0].type);
            formData.append("fileFileName", target.files[0].name);

            settings.fileType && formData.append('fileType', settings.fileType);

            $.ajax({
                url: $this.data('url'),
                type: "POST",
                data: formData,
                dataType: 'json',
                processData: false,
                contentType: false,
                cache: false,
                beforeSend: function () {
                    //console.log('start');
                    if (settings.beforeSend) {
                        settings.beforeSend();
                    }
                },
                xhr: function () {
                    var xhr = $.ajaxSettings.xhr();
                    if (xhr.upload) {
                        xhr.upload.addEventListener('progress', function (event) {
                            var total = event.total,
                                position = event.loaded || event.position,
                                percent = 0;
                            if (event.lengthComputable) {
                                percent = Math.ceil(position / total * 100);
                            }
                            if (settings.uploadProgress) {
                                settings.uploadProgress(event, position, total, percent);
                            }

                        }, false);
                    }
                    return xhr;
                },
                success: function (data, status, jXhr) {
                    if (settings.success) {
                        settings.success(data);
                    }
                },
                error: function (jXhr, status, error) {
                    if (settings.error) {
                        settings.error(jXhr, status, error);
                    }
                }
            });
        });
    };
    $.fn.uploadFile = function (options) {
        settings = $.extend({}, defaults, options);
        // 文件上传
        return this.each(function () {
            upload($(this));
        });
    }
})($ || jQuery);