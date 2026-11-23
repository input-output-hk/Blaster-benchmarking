import LiveScripts.Shared
import LiveScripts.S_7b6cd2ac4f9c820c4b65ef1396a5a37b28b6546eacaceee82fce6152.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7b6cd2ac4f9c820c4b65ef1396a5a37b28b6546eacaceee82fce6152.script [ctx] 10000]
