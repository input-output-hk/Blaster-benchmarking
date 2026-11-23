import LiveScripts.Shared
import LiveScripts.S_2ab32ec22330adf91e42905b008a1aa84ea7af7dc2dc85592497527c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2ab32ec22330adf91e42905b008a1aa84ea7af7dc2dc85592497527c.script [datum, redeemer, ctx] 10000]
