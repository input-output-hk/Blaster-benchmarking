import LiveScripts.Shared
import LiveScripts.S_b81afcbb6d78b66eb7cbfcc7a66ca0dde1f0cb254f6906dd9e2a1441.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b81afcbb6d78b66eb7cbfcc7a66ca0dde1f0cb254f6906dd9e2a1441.script [ctx] 10000]
