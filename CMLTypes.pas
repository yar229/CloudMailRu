﻿unit CMLTypes;

interface

const
{$IFDEF WIN64}
	PlatformX = 'x64';
{$ENDIF}
{$IFDEF WIN32}
	PlatformX = 'x32';
{$ENDIF}
	PUBLIC_ACCESS_URL = 'https://cloud.mail.ru/public/';
	OAUTH_TOKEN_URL = 'https://o2.mail.ru/token';
	TOKEN_URL = 'https://cloud.mail.ru/?from=promo&from=authpopup';
	LOGIN_URL = 'https://auth.mail.ru/cgi-bin/auth?from=splash';
	SECSTEP_URL = 'https://auth.mail.ru/cgi-bin/secstep';

	API_FILE = 'https://cloud.mail.ru/api/v2/file';
	API_FILE_MOVE = 'https://cloud.mail.ru/api/v2/file/move';
	API_FILE_PUBLISH = 'https://cloud.mail.ru/api/v2/file/publish';
	API_FILE_UNPUBLISH = 'https://cloud.mail.ru/api/v2/file/unpublish';
	API_FILE_RENAME = 'https://cloud.mail.ru/api/v2/file/rename';
	API_FILE_ADD = 'https://cloud.mail.ru/api/v2/file/add';
	API_FILE_REMOVE = 'https://cloud.mail.ru/api/v2/file/remove';
	API_FILE_COPY = 'https://cloud.mail.ru/api/v2/file/copy';
	API_FOLDER = 'https://cloud.mail.ru/api/v2/folder?sort={%22type%22%3A%22name%22%2C%22order%22%3A%22asc%22}&offset=0&limit=65535';
	API_FOLDER_ADD = 'https://cloud.mail.ru/api/v2/folder/add';
	API_FOLDER_SHARED_INFO = 'https://cloud.mail.ru/api/v2/folder/shared/info'; //get
	API_FOLDER_INVITES = 'https://cloud.mail.ru/api/v2/folder/invites';
	API_FOLDER_SHARE = 'https://cloud.mail.ru/api/v2/folder/share';
	API_FOLDER_UNSHARE = 'https://cloud.mail.ru/api/v2/folder/unshare';
	API_FOLDER_MOUNT = 'https://cloud.mail.ru/api/v2/folder/mount';
	API_FOLDER_UNMOUNT = 'https://cloud.mail.ru/api/v2/folder/unmount';
	API_FOLDER_SHARED_LINKS = 'https://cloud.mail.ru/api/v2/folder/shared/links';
	API_FOLDER_SHARED_INCOMING = 'https://cloud.mail.ru/api/v2/folder/shared/incoming';
	API_TRASHBIN = 'https://cloud.mail.ru/api/v2/trashbin';
	API_TRASHBIN_RESTORE = 'https://cloud.mail.ru/api/v2/trashbin/restore';
	API_TRASHBIN_EMPTY = 'https://cloud.mail.ru/api/v2/trashbin/empty';
	API_AB_CONTACTS = ''; //
	API_DISPATCHER = 'https://cloud.mail.ru/api/v2/dispatcher/';
	API_USER_SPACE = 'https://cloud.mail.ru/api/v2/user/space';
	API_CLONE = 'https://cloud.mail.ru/api/v2/clone';
	API_INVITE_REJECT = 'https://cloud.mail.ru/api/v2/folder/invites/reject';

	TYPE_DIR = 'folder';
	TYPE_FILE = 'file';

	KIND_SHARED = 'shared';
	{Константы для обозначения ошибок, возвращаемых при парсинге ответов облака. Дополняем по мере обнаружения}
	CLOUD_ERROR_UNKNOWN = -2; //unknown: 'Ошибка на сервере'
	CLOUD_OPERATION_ERROR_STATUS_UNKNOWN = -1;
	CLOUD_OPERATION_OK = 0;
	CLOUD_OPERATION_FAILED = 1;
	CLOUD_OPERATION_CANCELLED = 5;

	CLOUD_ERROR_EXISTS = 1; //exists: 'Папка с таким названием уже существует. Попробуйте другое название'
	CLOUD_ERROR_REQUIRED = 2; //required: 'Название папки не может быть пустым'
	CLOUD_ERROR_INVALID = 3; //invalid: '&laquo;' + app.escapeHTML(name) + '&raquo; это неправильное название папки. В названии папок нельзя использовать символы «" * / : < > ?  \\ |»'
	CLOUD_ERROR_READONLY = 4; //readonly|read_only: 'Невозможно создать. Доступ только для просмотра'
	CLOUD_ERROR_NAME_LENGTH_EXCEEDED = 5; //name_length_exceeded: 'Ошибка: Превышена длина имени папки. <a href="https://help.mail.ru/cloud_web/confines" target="_blank">Подробнее…</a>'
	CLOUD_ERROR_OVERQUOTA = 7; //overquota: 'Невозможно скопировать, в вашем Облаке недостаточно места'
	CLOUD_ERROR_QUOTA_EXCEEDED = 7; //"quota_exceeded": 'Невозможно скопировать, в вашем Облаке недостаточно места'
	CLOUD_ERROR_NOT_EXISTS = 8; //"not_exists": 'Копируемая ссылка не существует'
	CLOUD_ERROR_OWN = 9; //"own": 'Невозможно клонировать собственную ссылку'
	CLOUD_ERROR_NAME_TOO_LONG = 10; //"name_too_long": 'Превышен размер имени файла'
	CLOUD_ERROR_VIRUS_SCAN_FAIL = 11; //"virus_scan_fail": 'Файл заражен вирусом'
	CLOUD_ERROR_OWNER = 12; //Нельзя использовать собственный email
	CLOUD_ERROR_FAHRENHEIT = 451; //Публикация контента заблокирована по требованию правообладателя или уполномоченного государственного ведомства.
	CLOUD_ERROR_BAD_REQUEST = 400; //
	CLOUD_ERROR_TREES_CONFLICT = 15; //Нельзя сделать папку общей, если она содержит другие общие папки или находится в общей папке
	CLOUD_ERROR_UNPROCESSABLE_ENTRY = 16; //Нельзя открыть доступ к файлу
	CLOUD_ERROR_USER_LIMIT_EXCEEDED = 17; //Невозможно добавить пользователя. Вы можете иметь не более 200 пользователей в одной общей папке
	CLOUD_ERROR_EXPORT_LIMIT_EXCEEDED = 18; //Невозможно добавить пользователя. Вы можете создать не более 50 общих папок
	CLOUD_ERROR_NOT_ACCEPTABLE = 406; //Нельзя добавить этого пользователя

	{Режимы работы при конфликтах копирования}
	CLOUD_CONFLICT_STRICT = 'strict'; //возвращаем ошибку при существовании файла
	CLOUD_CONFLICT_IGNORE = 'ignore'; //В API, видимо, не реализовано
	CLOUD_CONFLICT_RENAME = 'rename'; //Переименуем новый файл
	//CLOUD_CONFLICT_REPLACE = 'overwrite'; // хз, этот ключ не вскрыт

	CLOUD_SHARE_ACCESS_READ_ONLY = 'read_only';
	CLOUD_SHARE_ACCESS_READ_WRITE = 'read_write';

	CLOUD_MAX_NAME_LENGTH = 255;
	CLOUD_PUBLISH = true;
	CLOUD_UNPUBLISH = false;

	CLOUD_SHARE_RW = 0;
	CLOUD_SHARE_RO = 1;
	CLOUD_SHARE_NO = 2;

	{Поддерживаемые методы авторизации}
	CLOUD_AUTH_METHOD_WEB = 0; //Через парсинг HTTP-страницы
	CLOUD_AUTH_METHOD_TWO_STEP = 1; //Через парсинг HTTP-страницы, двухфакторная
	CLOUD_AUTH_METHOD_OAUTH = 2; //Через сервер OAuth-авторизации

	{Константа использования мобильного аутентификатора для двухфакторной авторизации}
	AUTH_APP_USED = -1;

	{Коды HTTP-ошибок при постинге запросов}
	HTTP_ERROR_BAD_REQUEST = 400;
	HTTP_ERROR_OVERQUOTA = 507;
	HTTP_ERROR_EXISTS = 500;

	{Методы HTTP}
	HTTP_METHOD_GET = 0;
	HTTP_METHOD_POST = 1;

	HTTP_METHODS = [HTTP_METHOD_GET, HTTP_METHOD_POST];

type
	TCloudMailRuDirListingItem = Record
		tree: WideString;
		name: WideString;
		visible_name: WideString;
		grev: integer;
		size: int64;
		kind: WideString;
		weblink: WideString;
		rev: integer;
		type_: WideString;
		home: WideString;
		mtime: int64;
		hash: WideString;
		virus_scan: WideString;
		folders_count: integer;
		files_count: integer;
		deleted_at: integer;
		deleted_from: WideString;
		deleted_by: integer;
	End;

	TCloudMailRuOAuthInfo = Record
		error: WideString;
		error_code: integer;
		error_description: WideString;
		expires_in: integer;
		refresh_token: WideString;
		access_token: WideString;
	end;

	TCloudMailRuSpaceInfo = record
		overquota: Boolean;
		total: int64;
		used: int64;
	End;

	TCloudMailRuOwnerInfo = record
		email: WideString;
		name: WideString;
	end;

	TCloudMailRuInviteInfo = record
		email: WideString;
		status: WideString;
		access: WideString;
		name: WideString;

	end;

	TCloudMailRuIncomingInviteInfo = record
		owner: TCloudMailRuOwnerInfo;
		tree: WideString;
		access: WideString;
		name: WideString;
		size: int64;
		home: WideString; //only on already mounted items
		invite_token: WideString;
	end;

	TCloudMailRuTwostepData = record
		form_name: WideString;
		auth_host: WideString;
		secstep_phone: WideString;
		secstep_page: WideString;
		secstep_code_fail: WideString;
		secstep_resend_fail: WideString;
		secstep_resend_success: WideString;
		secstep_timeout: int64;
		secstep_login: WideString;
		secstep_disposable_fail: WideString;
		secstep_smsapi_error: WideString;
		secstep_captcha: WideString;
		totp_enabled: WideString;
		locale: WideString;
		client: WideString;
		csrf: WideString;
		device: WideString;
		{some items skipped}
	end;

	TCloudMailRuDirListing = array of TCloudMailRuDirListingItem;
	TCloudMailRuInviteInfoListing = array of TCloudMailRuInviteInfo;
	TCloudMailRuIncomingInviteInfoListing = array of TCloudMailRuIncomingInviteInfo;

implementation

end.
