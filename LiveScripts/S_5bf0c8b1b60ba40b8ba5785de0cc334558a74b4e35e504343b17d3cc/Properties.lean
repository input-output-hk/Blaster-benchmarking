import LiveScripts.Shared
import LiveScripts.S_5bf0c8b1b60ba40b8ba5785de0cc334558a74b4e35e504343b17d3cc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5bf0c8b1b60ba40b8ba5785de0cc334558a74b4e35e504343b17d3cc.script [ctx] 10000]
