{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE NoImplicitPrelude          #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE RecordWildCards            #-}
{-# LANGUAGE TypeFamilies               #-}

-- {-# OPTIONS_GHC -fno-warn-unused-imports #-}
-- {-# OPTIONS_GHC -fno-warn-unused-binds  #-} doesnt work if wall is used
{-# OPTIONS_GHC -w #-}

-- Module      : Network.AWS.IAM.UpdateSigningCertificate
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Changes the status of the specified signing certificate from active to
-- disabled, or vice versa. This action can be used to disable a user's
-- signing certificate as part of a certificate rotation work flow. If the
-- UserName field is not specified, the UserName is determined implicitly
-- based on the AWS access key ID used to sign the request. Because this
-- action works for access keys under the AWS account, you can use this action
-- to manage root credentials even if the AWS account has no associated users.
-- For information about rotating certificates, see Managing Keys and
-- Certificates in the Using IAM guide.
module Network.AWS.IAM.UpdateSigningCertificate
    (
    -- * Request
      UpdateSigningCertificate
    -- ** Request constructor
    , updateSigningCertificate
    -- ** Request lenses
    , uscCertificateId
    , uscStatus
    , uscUserName

    -- * Response
    , UpdateSigningCertificateResponse
    -- ** Response constructor
    , updateSigningCertificateResponse
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.Query
import Network.AWS.IAM.Types

data UpdateSigningCertificate = UpdateSigningCertificate
    { _uscCertificateId :: Text
    , _uscStatus        :: Text
    , _uscUserName      :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'UpdateSigningCertificate' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'uscCertificateId' @::@ 'Text'
--
-- * 'uscStatus' @::@ 'Text'
--
-- * 'uscUserName' @::@ 'Maybe' 'Text'
--
updateSigningCertificate :: Text -- ^ 'uscCertificateId'
                         -> Text -- ^ 'uscStatus'
                         -> UpdateSigningCertificate
updateSigningCertificate p1 p2 = UpdateSigningCertificate
    { _uscCertificateId = p1
    , _uscStatus        = p2
    , _uscUserName      = Nothing
    }

-- | The ID of the signing certificate you want to update.
uscCertificateId :: Lens' UpdateSigningCertificate Text
uscCertificateId = lens _uscCertificateId (\s a -> s { _uscCertificateId = a })

-- | The status you want to assign to the certificate. Active means the
-- certificate can be used for API calls to AWS, while Inactive means the
-- certificate cannot be used.
uscStatus :: Lens' UpdateSigningCertificate Text
uscStatus = lens _uscStatus (\s a -> s { _uscStatus = a })

-- | The name of the user the signing certificate belongs to.
uscUserName :: Lens' UpdateSigningCertificate (Maybe Text)
uscUserName = lens _uscUserName (\s a -> s { _uscUserName = a })
instance ToQuery UpdateSigningCertificate

instance ToPath UpdateSigningCertificate where
    toPath = const "/"

data UpdateSigningCertificateResponse = UpdateSigningCertificateResponse
    deriving (Eq, Ord, Show, Generic)

-- | 'UpdateSigningCertificateResponse' constructor.
updateSigningCertificateResponse :: UpdateSigningCertificateResponse
updateSigningCertificateResponse = UpdateSigningCertificateResponse
instance FromXML UpdateSigningCertificateResponse where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "UpdateSigningCertificateResponse"

instance AWSRequest UpdateSigningCertificate where
    type Sv UpdateSigningCertificate = IAM
    type Rs UpdateSigningCertificate = UpdateSigningCertificateResponse

    request  = post "UpdateSigningCertificate"
    response = nullaryResponse UpdateSigningCertificateResponse
