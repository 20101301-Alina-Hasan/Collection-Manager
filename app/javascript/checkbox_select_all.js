document.addEventListener('DOMContentLoaded', function() {
  function setupSelectAll(selectAllId, checkboxName) {
      const selectAllCheckbox = document.getElementById(selectAllId);
      const checkboxes = document.querySelectorAll(`input[name="${checkboxName}"]`);
      
      if (selectAllCheckbox) {
          selectAllCheckbox.addEventListener('change', function() {
              checkboxes.forEach(function(checkbox) {
                  checkbox.checked = selectAllCheckbox.checked;
              });
          });
      }
  }

  setupSelectAll('select_all_users', 'user_ids[]');
  setupSelectAll('select_all_collections', 'collection_ids[]');
});
