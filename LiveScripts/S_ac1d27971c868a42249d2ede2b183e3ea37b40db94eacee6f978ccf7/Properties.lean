import LiveScripts.Shared
import LiveScripts.S_ac1d27971c868a42249d2ede2b183e3ea37b40db94eacee6f978ccf7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ac1d27971c868a42249d2ede2b183e3ea37b40db94eacee6f978ccf7.script [ctx] 10000]
