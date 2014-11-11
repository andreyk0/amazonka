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

-- Module      : Network.AWS.CloudSearch.DeleteIndexField
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Removes an IndexField from the search domain. For more information, see
-- Configuring Index Fields in the Amazon CloudSearch Developer Guide.
module Network.AWS.CloudSearch.DeleteIndexField
    (
    -- * Request
      DeleteIndexField
    -- ** Request constructor
    , deleteIndexField
    -- ** Request lenses
    , dif1DomainName
    , dif1IndexFieldName

    -- * Response
    , DeleteIndexFieldResponse
    -- ** Response constructor
    , deleteIndexFieldResponse
    -- ** Response lenses
    , difrIndexField
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.Query
import Network.AWS.CloudSearch.Types

data DeleteIndexField = DeleteIndexField
    { _dif1DomainName     :: Text
    , _dif1IndexFieldName :: Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'DeleteIndexField' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dif1DomainName' @::@ 'Text'
--
-- * 'dif1IndexFieldName' @::@ 'Text'
--
deleteIndexField :: Text -- ^ 'dif1DomainName'
                 -> Text -- ^ 'dif1IndexFieldName'
                 -> DeleteIndexField
deleteIndexField p1 p2 = DeleteIndexField
    { _dif1DomainName     = p1
    , _dif1IndexFieldName = p2
    }

dif1DomainName :: Lens' DeleteIndexField Text
dif1DomainName = lens _dif1DomainName (\s a -> s { _dif1DomainName = a })

-- | The name of the index field your want to remove from the domain's
-- indexing options.
dif1IndexFieldName :: Lens' DeleteIndexField Text
dif1IndexFieldName =
    lens _dif1IndexFieldName (\s a -> s { _dif1IndexFieldName = a })
instance ToQuery DeleteIndexField

instance ToPath DeleteIndexField where
    toPath = const "/"

newtype DeleteIndexFieldResponse = DeleteIndexFieldResponse
    { _difrIndexField :: IndexFieldStatus
    } deriving (Eq, Show, Generic)

-- | 'DeleteIndexFieldResponse' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'difrIndexField' @::@ 'IndexFieldStatus'
--
deleteIndexFieldResponse :: IndexFieldStatus -- ^ 'difrIndexField'
                         -> DeleteIndexFieldResponse
deleteIndexFieldResponse p1 = DeleteIndexFieldResponse
    { _difrIndexField = p1
    }

-- | The status of the index field being deleted.
difrIndexField :: Lens' DeleteIndexFieldResponse IndexFieldStatus
difrIndexField = lens _difrIndexField (\s a -> s { _difrIndexField = a })
instance FromXML DeleteIndexFieldResponse where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "DeleteIndexFieldResponse"

instance AWSRequest DeleteIndexField where
    type Sv DeleteIndexField = CloudSearch
    type Rs DeleteIndexField = DeleteIndexFieldResponse

    request  = post "DeleteIndexField"
    response = xmlResponse $ \h x -> DeleteIndexFieldResponse
        <$> x %| "IndexField"
