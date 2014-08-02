{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.Redshift.V2012_12_01.DescribeReservedNodeOfferings
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns a list of the available reserved node offerings by Amazon Redshift
-- with their descriptions including the node type, the fixed and recurring
-- costs of reserving the node and duration the node will be reserved for you.
-- These descriptions help you determine which reserve node offering you want
-- to purchase. You then use the unique offering ID in you call to
-- PurchaseReservedNodeOffering to reserve one or more nodes for your Amazon
-- Redshift cluster. For more information about managing parameter groups, go
-- to Purchasing Reserved Nodes in the Amazon Redshift Management Guide.
-- https://redshift.us-east-1.amazonaws.com/
-- ?Action=DescribeReservedNodeOfferings &Version=2012-12-01
-- &x-amz-algorithm=AWS4-HMAC-SHA256
-- &x-amz-credential=AKIAIOSFODNN7EXAMPLE/20130117/us-east-1/redshift/aws4_request
-- &x-amz-date=20130117T232351Z
-- &x-amz-signedheaders=content-type;host;x-amz-date Heavy Utilization
-- 94608000 Hourly 0.21 12452.0 3a98bf7d-979a-49cc-b568-18f24315baf0 0.0
-- dw1.8xlarge Heavy Utilization 31536000 Hourly 0.09 1815.0
-- d586503b-289f-408b-955b-9c95005d6908 0.0 dw1.xlarge
-- f4a07e06-60fc-11e2-95d9-658e9466d117.
module Network.AWS.Redshift.V2012_12_01.DescribeReservedNodeOfferings where

import Control.Lens
import Network.AWS.Request.Query
import Network.AWS.Redshift.V2012_12_01.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'DescribeReservedNodeOfferings' request.
describeReservedNodeOfferings :: DescribeReservedNodeOfferings
describeReservedNodeOfferings = DescribeReservedNodeOfferings
    { _drnomMaxRecords = Nothing
    , _drnomReservedNodeOfferingId = Nothing
    , _drnomMarker = Nothing
    }

data DescribeReservedNodeOfferings = DescribeReservedNodeOfferings
    { _drnomMaxRecords :: Maybe Integer
      -- ^ The maximum number of response records to return in each call. If
      -- the number of remaining response records exceeds the specified
      -- MaxRecords value, a value is returned in a marker field of the
      -- response. You can retrieve the next set of records by retrying
      -- the command with the returned marker value. Default: 100
      -- Constraints: minimum 20, maximum 100.
    , _drnomReservedNodeOfferingId :: Maybe Text
      -- ^ The unique identifier for the offering.
    , _drnomMarker :: Maybe Text
      -- ^ An optional parameter that specifies the starting point to return
      -- a set of response records. When the results of a
      -- DescribeReservedNodeOfferings request exceed the value specified
      -- in MaxRecords, AWS returns a value in the Marker field of the
      -- response. You can retrieve the next set of response records by
      -- providing the returned marker value in the Marker parameter and
      -- retrying the request.
    } deriving (Generic)

makeLenses ''DescribeReservedNodeOfferings

instance ToQuery DescribeReservedNodeOfferings where
    toQuery = genericToQuery def

data DescribeReservedNodeOfferingsResponse = DescribeReservedNodeOfferingsResponse
    { _rnomReservedNodeOfferings :: [ReservedNodeOffering]
      -- ^ A list of reserved node offerings.
    , _rnomMarker :: Maybe Text
      -- ^ A value that indicates the starting point for the next set of
      -- response records in a subsequent request. If a value is returned
      -- in a response, you can retrieve the next set of records by
      -- providing this returned marker value in the Marker parameter and
      -- retrying the command. If the Marker field is empty, all response
      -- records have been retrieved for the request.
    } deriving (Generic)

makeLenses ''DescribeReservedNodeOfferingsResponse

instance FromXML DescribeReservedNodeOfferingsResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest DescribeReservedNodeOfferings where
    type Sv DescribeReservedNodeOfferings = Redshift
    type Rs DescribeReservedNodeOfferings = DescribeReservedNodeOfferingsResponse

    request = post "DescribeReservedNodeOfferings"
    response _ = xmlResponse

instance AWSPager DescribeReservedNodeOfferings where
    next rq rs = (\x -> rq { Keyed "_drnomMarker" = Just x })
        <$> (Keyed "_rnomMarker" rs)
