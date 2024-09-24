document.addEventListener("turbo:load", function () {
  const imageInput = document.getElementById("imageInput");
  const imagePreview = document.getElementById("imagePreview");
  const imageEdit = document.getElementById("imageEdit");
  imageInput?.addEventListener("change", function () {
    const file = this.files[0];

    if (file && file.type.startsWith("image/")) {
      const reader = new FileReader();

      reader.onload = function (e) {
        imagePreview.src = e.target.result;
        imagePreview.style.display = "block";
        imageEdit.style.display = "none";
      };

      reader.readAsDataURL(file);
    } else {
      imagePreview.style.display = "none";
    }
  });
});
