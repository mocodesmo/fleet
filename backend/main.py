from backend.api.walk_ws import walk_ws
import model.walk
import model.user
from api.user_admin_post import user_admin_post
from api.user_users_get import user_users_get
from api.walk_ws import Walking
from api.user_login_get import user_login_get
from pkg.auth import enable_test_auth
from pkg.mongo import setup_mongo
from pkg.firebase import setup_firebase
from pkg.server import create_fast_app
from api.issue_post import issue_post
from fastapi.staticfiles import StaticFiles
from pkg.sentry import setup_sentry

# enable_test_auth()
setup_firebase(is_test=False)
setup_mongo()
setup_sentry()

app = create_fast_app()


app.add_api_route('/user/login', user_login_get, methods=['GET'])
app.add_api_route('/user/admin', user_admin_post, methods=['POST'])
app.add_api_route('/user/users', user_users_get, methods=['GET'])
app.add_api_route('/issue', issue_post, methods=['POST'])

app.add_api_websocket_route('/walk', walk_ws)
app.mount("/fleet", StaticFiles(directory="fleet-ui"), name="fleet")


@app.get('/status')
def status():
    return 'OK'
