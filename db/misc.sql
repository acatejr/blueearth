-- find all records where webserver_layer begins with 'images_'
select id, webserver_layer from image where webserver_layer regexp '^images_';
update image set webserver_layer = replace(webserver_layer, 'images_', '') where webserver_layer regexp '^images_';
update image set webserver_layer = replace(webserver_layer, 'Images_', '') where webserver_layer regexp '^Images_';
update image set webserver_layer = replace(webserver_layer, 'IMAGES_', '') where webserver_layer regexp '^IMAGES_';

UPDATE emp set designation=replace(designation, 'Sales', 'Marketing') where department='Marketing'